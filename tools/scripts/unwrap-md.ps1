Param(
    [Parameter(Mandatory = $false)]
    [string]$Root = ".\docs"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $Root)) {
    throw ("Path '{0}' not found." -f $Root)
}

# Output encoding: UTF-8 no BOM
$Enc = New-Object System.Text.UTF8Encoding($false)
$nl  = "`n"

$files = Get-ChildItem -LiteralPath $Root -Filter '*.md' -Recurse -File
Write-Host ("Found {0} markdown files..." -f $files.Count) -ForegroundColor Cyan

# ---------------- Helpers ----------------
function Normalize-Newlines([string]$s) {
    return ($s -replace "`r`n", "`n" -replace "`r", "`n")
}

function Trim-Right([string]$s) {
    return ($s -replace '[ \t]+$', '')
}

function Is-Blank([string]$line) {
    return [string]::IsNullOrWhiteSpace($line)
}

function Is-CodeFence([string]$line) {
    return ($line -match '^\s*```')
}

function Is-ListItemLine([string]$line) {
    return ($line -match '^(?<indent>[ \t]*)(?<marker>[-*])[ \t]+(?<text>\S.*)$')
}

function Get-IndentLen([string]$s) {
    $len = 0
    foreach ($ch in $s.ToCharArray()) {
        if ($ch -eq "`t") { $len += 4 } else { $len += 1 }
    }
    return $len
}

function Strip-EmphasisPreserveIndent([string]$s) {
    # Preserve leading whitespace; strip emphasis in the rest.
    $m  = [regex]::Match($s, '^(?<ws>[ \t]*)(?<rest>.*)$')
    $ws = $m.Groups['ws'].Value
    $r  = $m.Groups['rest'].Value

    # Iteratively remove emphasis until stable (handles multiple occurrences per line)
    $prev = $null
    while ($r -ne $prev) {
        $prev = $r

        # Bold: **...**
        # Allow almost any char except newline; stop at the nearest **
        $r = [regex]::Replace($r, '\*\*(.+?)\*\*', '$1')

        # Italic: *...* (but not **...**)
        # Use negative lookarounds to avoid grabbing bold markers
        $r = [regex]::Replace($r, '(?<!\*)\*(.+?)\*(?!\*)', '$1')
    }

    return ($ws + $r)
}

function Strip-AllLinksPreserveIndent([string]$s) {
    $m = [regex]::Match($s, '^(?<ws>[ \t]*)(?<rest>.*)$')
    $ws = $m.Groups['ws'].Value
    $r  = $m.Groups['rest'].Value

    $r = [regex]::Replace($r, '\[[^\]]*\]\(\s*https?:\/\/[^\s\)]+?\s*\)', '')
    $r = [regex]::Replace($r, '<\s*https?:\/\/[^>]+\s*>', '')
    $r = [regex]::Replace($r, '(?i)\bhttps?:\/\/[^\s<>()\[\]{}"''`]+', '')
    $r = [regex]::Replace($r, '(?i)\bwww\.[^\s<>()\[\]{}"''`]+', '')

    $r = [regex]::Replace($r, '\(\s*\)', '')
    $r = [regex]::Replace($r, '\s+([,.;:!?])', '$1')
    $r = [regex]::Replace($r, ' {2,}', ' ')
    return ($ws + (Trim-Right $r))
}

function PreNormalize-InlineBullets([string]$body) {
    $lines  = (Normalize-Newlines $body).Split("`n", [System.StringSplitOptions]::None)
    $out    = New-Object System.Collections.Generic.List[string]
    $inCode = $false

    foreach ($ln in $lines) {
        $l = Trim-Right $ln

        if (Is-CodeFence $l) { $out.Add($l) | Out-Null; $inCode = -not $inCode; continue }
        if ($inCode) { $out.Add($l) | Out-Null; continue }

        $l = [regex]::Replace($l, '([:;.!?])\s+-\s+(?=\S)', "`$1$nl- ")
        $out.Add($l) | Out-Null
    }

    return ($out -join $nl)
}

function PreNormalize-InlineTagContexts([string]$body, [string]$tagRx) {
    # Fix: "... - TAG (Context): ..." => newline + "- [TAG] (Context): ..."
    # Also fixes split variant: " - TAG`n(Context):" => " - TAG (Context):"
    $lines  = (Normalize-Newlines $body).Split("`n", [System.StringSplitOptions]::None)
    $out    = New-Object System.Collections.Generic.List[string]
    $inCode = $false

    for ($i = 0; $i -lt $lines.Length; $i++) {
        $l = Trim-Right $lines[$i]

        if (Is-CodeFence $l) { $out.Add($l) | Out-Null; $inCode = -not $inCode; continue }
        if ($inCode) { $out.Add($l) | Out-Null; continue }

        # If we have "... - TAG" and next line is "(Context): ..." => merge into one line for easier parsing
        if ($i + 1 -lt $lines.Length) {
            $next = Trim-Right $lines[$i + 1]
            if ($l -match "^(?<p>.*)\s+-\s*(?<tag>$tagRx)\s*$" -and $next -match '^\s*\([^)]+\)\s*:') {
                $l = ($matches['p'] + " - " + $matches['tag'] + " " + $next.Trim())
                $i++ # consume next line
            }
        }

        # Now split "... - TAG (Context): rest" into a separate bullet
        $l = [regex]::Replace(
            $l,
            "(\S)\s+-\s*(?<tag>$tagRx)\s*(?<ctx>\([^)]+\))\s*:\s*",
            "`$1$nl- [`${tag}] `${ctx}: "
        )

        # Also support "... - TAG: rest" (standard)
        $l = [regex]::Replace(
            $l,
            "(\S)\s+-\s*(?<tag>$tagRx)\s*:\s*",
            "`$1$nl- [`${tag}]: "
        )

        $out.Add($l) | Out-Null
    }

    $res = ($out -join $nl)
    $res = [regex]::Replace($res, '(?m)^\s*[-*]\s*$', '')
    return $res
}

function PreNormalize-InlineTags([string]$body, [string]$tagRx) {
    # Keep for simple "... - TAG: ..." cases in plain text (not context)
    $lines  = (Normalize-Newlines $body).Split("`n", [System.StringSplitOptions]::None)
    $out    = New-Object System.Collections.Generic.List[string]
    $inCode = $false

    foreach ($ln in $lines) {
        $l = Trim-Right $ln

        if (Is-CodeFence $l) { $out.Add($l) | Out-Null; $inCode = -not $inCode; continue }
        if ($inCode) { $out.Add($l) | Out-Null; continue }

        $l = [regex]::Replace($l, "(\S)\s+-\s*$tagRx\s*:\s*", "`$1$nl- `$2: ")
        $out.Add($l) | Out-Null
    }

    $res = ($out -join $nl)
    $res = [regex]::Replace($res, '(?m)^\s*[-*]\s*$', '')
    return $res
}

function Canonicalize-TagLinePreserveIndent([string]$line, [string]$tagRx) {
    # Accept:
    #   - TAG: text
    #   - [TAG] text
    #   - [TAG]: text
    #   - [TAG] (Context): text
    $m = [regex]::Match($line, "^(?<indent>[ \t]*)(?<marker>[-*][ \t]+)?\[?(?<tag>$tagRx)\]?(?<ctx>\s*\([^)]+\))?\s*:?\s+(?<text>.+)$")
    if (-not $m.Success) { return $line }

    $indent = $m.Groups['indent'].Value
    $marker = $m.Groups['marker'].Value
    $tag    = $m.Groups['tag'].Value
    $ctx    = $m.Groups['ctx'].Value
    $text   = $m.Groups['text'].Value.Trim()

    if ([string]::IsNullOrEmpty($marker)) {
        if ($indent -ne '') { return $line }
        if ($ctx -ne '') { return ("- [{0}]{1}: {2}" -f $tag, $ctx, $text) }
        return ("- [{0}] {1}" -f $tag, $text)
    }

    if ($ctx -ne '') { return ("{0}{1}[{2}]{3}: {4}" -f $indent, $marker, $tag, $ctx, $text) }
    return ("{0}{1}[{2}] {3}" -f $indent, $marker, $tag, $text)
}

function Is-LinkOnlyLine([string]$line) {
    $l = $line.Trim()
    if ($l -eq '') { return $false }
    if ($l -match '^\[\[?\d+\]?\]\(\s*https?:\/\/[^\s\)]+?\s*\)\s*$') { return $true }
    if ($l -match '^\[[^\]]+\]\(\s*https?:\/\/[^\s\)]+?\s*\)\s*$') { return $true }
    if ($l -match '^<\s*https?:\/\/[^>]+\s*>\s*$') { return $true }
    if ($l -match '(?i)^https?:\/\/\S+\s*$') { return $true }
    if ($l -match '(?i)^www\.\S+\s*$') { return $true }
    return $false
}

function Is-StructuralLine([string]$line) {
    return (
        ($line -match '^\s*#{1,6}\s+\S') -or
        ($line -match '^\s*[-*]\s+\S') -or
        ($line -match '^\s*>\s+\S') -or
        ($line -match '^\s*\|') -or
        (Is-CodeFence $line)
    )
}

function Remove-BibliographyBlocks([string]$body) {
    $lines = (Normalize-Newlines $body).Split("`n", [System.StringSplitOptions]::None)
    $n = $lines.Length
    $keep = New-Object 'System.Collections.Generic.List[bool]'
    for ($i = 0; $i -lt $n; $i++) { [void]$keep.Add($true) }

    $inCode = $false
    $i = 0
    while ($i -lt $n) {
        $line = Trim-Right $lines[$i]

        if (Is-CodeFence $line) { $inCode = -not $inCode; $i++; continue }
        if ($inCode) { $i++; continue }

        if (-not (Is-LinkOnlyLine $line)) { $i++; continue }

        $start = $i
        $end = $i
        $linkCount = 0
        $j = $i
        $lastLink = $i

        while ($j -lt $n) {
            $cur = Trim-Right $lines[$j]
            if (Is-CodeFence $cur) { break }

            if (Is-LinkOnlyLine $cur) {
                $linkCount++
                $lastLink = $j
                $end = $j
                $j++
                continue
            }

            if (Is-Blank $cur) { $end = $j; $j++; continue }

            $distance = $j - $lastLink
            $isTitleCandidate = (-not (Is-StructuralLine $cur)) -and ($cur.Trim().Length -le 240)

            if (($distance -le 2) -and $isTitleCandidate) { $end = $j; $j++; continue }

            break
        }

        if ($linkCount -ge 2) {
            for ($k = $start; $k -le $end; $k++) { $keep[$k] = $false }
        }

        $i = $end + 1
    }

    $out = New-Object System.Collections.Generic.List[string]
    for ($i = 0; $i -lt $n; $i++) {
        if ($keep[$i]) { $out.Add($lines[$i]) | Out-Null }
    }
    return ($out -join $nl)
}

function Remove-ExistingDataAppendix([string]$body) {
    $lines = (Normalize-Newlines $body).Split("`n", [System.StringSplitOptions]::None)
    $inCode = $false
    for ($i = 0; $i -lt $lines.Length; $i++) {
        $line = $lines[$i]
        if (Is-CodeFence $line) { $inCode = -not $inCode; continue }
        if ($inCode) { continue }

        if ($line -match '^\s*##\s+Data Appendix\s*$') {
            $kept = @()
            if ($i -gt 0) { $kept = $lines[0..($i-1)] }
            return ,@(($kept -join $nl), ($lines[$i..($lines.Length-1)] -join $nl))
        }
    }
    return ,@($body, '')
}

function Extract-ScenarioTail([string]$body) {
    $lines = (Normalize-Newlines $body).Split("`n", [System.StringSplitOptions]::None)
    $inCode = $false

    for ($i = 0; $i -lt $lines.Length; $i++) {
        $line = $lines[$i]
        if (Is-CodeFence $line) { $inCode = -not $inCode; continue }
        if ($inCode) { continue }

        if ($line -match '^\s*scenarios:\s*$') {
            $head = ''
            if ($i -gt 0) { $head = ($lines[0..($i-1)] -join $nl) }
            $tail = ($lines[$i..($lines.Length-1)] -join $nl)
            return ,@($head, $tail)
        }
    }
    return ,@($body, '')
}

function Clean-YamlBlock([string]$yamlText) {
    $t = (Normalize-Newlines $yamlText).Trim()
    $t = [regex]::Replace($t, '^\s*```(?:yaml)?\s*', '', 'Multiline')
    $t = [regex]::Replace($t, '\s*```\s*$', '', 'Multiline')
    $t = [regex]::Replace($t, '(?m)^\s*##\s+Data Appendix\s*$', '')
    $t = [regex]::Replace($t, '(?m)^\s*-{5,}\s*$', '')
    return $t.Trim()
}

function Join-Header-Body([string]$header, [string]$body) {
    if ([string]::IsNullOrEmpty($header)) { return $body }
    $h = $header.TrimEnd()
    $b = $body.Trim()
    if ($b -eq '') { return ($h + $nl) }
    return ($h + $nl + $nl + $b)
}

function Join-WrappedListText([string]$body) {
    $lines = (Normalize-Newlines $body).Split("`n", [System.StringSplitOptions]::None)
    $out = New-Object System.Collections.Generic.List[string]
    $inCode = $false

    for ($i = 0; $i -lt $lines.Length; $i++) {
        $line = Trim-Right $lines[$i]

        if (Is-CodeFence $line) { $out.Add($line) | Out-Null; $inCode = -not $inCode; continue }
        if ($inCode) { $out.Add($line) | Out-Null; continue }

        $m = [regex]::Match($line, '^(?<indent>[ \t]*)(?<marker>[-*])[ \t]+(?<text>\S.*)$')
        if (-not $m.Success) { $out.Add($line) | Out-Null; continue }

        $indent = $m.Groups['indent'].Value
        $marker = $m.Groups['marker'].Value
        $textParts = New-Object System.Collections.Generic.List[string]
        $textParts.Add($m.Groups['text'].Value.Trim()) | Out-Null
        $baseIndentLen = Get-IndentLen $indent

        while (($i + 1) -lt $lines.Length) {
            $peekRaw = Trim-Right $lines[$i + 1]
            if (Is-Blank $peekRaw) { break }
            if (Is-CodeFence $peekRaw) { break }

            $pm = [regex]::Match($peekRaw, '^(?<pindent>[ \t]*)(?<prest>.*)$')
            $pindent = $pm.Groups['pindent'].Value
            $prest   = $pm.Groups['prest'].Value

            $pIndentLen = Get-IndentLen $pindent

            if ($pIndentLen -le $baseIndentLen -and (Is-StructuralLine $peekRaw)) { break }
            if ($pIndentLen -gt $baseIndentLen -and (Is-ListItemLine $peekRaw)) { break }

            $i++
            $cont = $prest.Trim()
            if ($cont -ne '') { $textParts.Add($cont) | Out-Null }
        }

        $joined = ($textParts -join ' ')
        $joined = [regex]::Replace($joined, ' {2,}', ' ').Trim()
        $out.Add(("{0}{1} {2}" -f $indent, $marker, $joined)) | Out-Null
    }

    return ($out -join $nl)
}

# ---------------- Main ----------------
$tagRx = '(FACT|ASSUMPTION|PROJECTION|UNKNOWN|DECISION|FORBIDDEN|DEFAULT|CONSTRAINT|CANON DECISION|CANON CONSTRAINT|CAUSE|MECHANISM|CONSEQUENCE)'

foreach ($file in $files) {
    Write-Host ("Processing: {0}" -f $file.Name) -NoNewline

    try {
        $raw  = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        $text = Normalize-Newlines $raw

        # Split YAML front-matter
        $header   = ''
        $body     = $text
        $footer   = ''
        $docClass = 'unknown'

        if ($text.StartsWith('---')) {
            $endHead = $text.IndexOf('---', 3)
            if ($endHead -gt 0) {
                $header = $text.Substring(0, $endHead + 3)
                $body   = $text.Substring($endHead + 3)

                if ($header -match 'class:\s*(\w+)') {
                    $docClass = $matches[1].Trim().ToLower()
                }
            }
        }

        # Basic cleanup
        $body = $body -replace '\*\(\s*Продолжение\s*\)\*', ''
        $body = $body -replace '\(Продолжение\)', ''
        $body = $body -replace '\\n', '<br>'

        # Idempotent Data Appendix
        $pair = Remove-ExistingDataAppendix $body
        $body = $pair[0]
        $oldAppendix = $pair[1]

        # Remove bibliography blocks
        $body = Remove-BibliographyBlocks $body

        # Normalize inline bullets and tag+context splits
        $body = PreNormalize-InlineBullets $body
        $body = PreNormalize-InlineTagContexts $body $tagRx
        $body = PreNormalize-InlineTags $body $tagRx

        # Extract scenarios tail to appendix
        $ex = Extract-ScenarioTail $body
        $body = $ex[0]
        $tail = $ex[1]
        if ([string]::IsNullOrWhiteSpace($tail) -and -not [string]::IsNullOrWhiteSpace($oldAppendix)) {
            $tail = $oldAppendix
        }
        if (-not [string]::IsNullOrWhiteSpace($tail)) {
            $yaml = Clean-YamlBlock $tail
            if (-not [string]::IsNullOrWhiteSpace($yaml)) {
                $footer = $nl + $nl + '## Data Appendix' + $nl + $nl + '```yaml' + $nl + $yaml + $nl + '```'
            }
        }

        # Join wrapped text inside list items
        $body = Join-WrappedListText $body

        # Line-by-line processing
        $lines  = (Normalize-Newlines $body).Split("`n", [System.StringSplitOptions]::None)
        $out    = New-Object System.Collections.Generic.List[string]
        $inCode = $false

        foreach ($ln in $lines) {
            $line = Trim-Right $ln

            if (Is-CodeFence $line) { $out.Add($line) | Out-Null; $inCode = -not $inCode; continue }
            if ($inCode) { $out.Add($line) | Out-Null; continue }

            $line2 = Strip-EmphasisPreserveIndent $line
            $line2 = Strip-AllLinksPreserveIndent $line2

            if (Is-Blank $line2) { $out.Add('') | Out-Null; continue }

            $line2 = Canonicalize-TagLinePreserveIndent $line2 $tagRx
            $out.Add($line2) | Out-Null
        }

        # Collapse 3+ blank lines to max 2
        $bodyOut = ($out -join $nl)
        $bodyOut = [regex]::Replace($bodyOut, "(\n){3,}", ($nl + $nl))

        $finalContent = Join-Header-Body $header $bodyOut
        if ($footer -ne '') { $finalContent = $finalContent.TrimEnd() + $footer }

        $finalContent = Normalize-Newlines $finalContent
        [System.IO.File]::WriteAllText($file.FullName, $finalContent, $Enc)

        Write-Host (" [OK] Class: {0}" -f $docClass) -ForegroundColor Green
    }
    catch {
        Write-Host (" [ERROR] {0}" -f $_.Exception.Message) -ForegroundColor Red
        throw
    }
}

Write-Host 'Done.' -ForegroundColor Cyan
