# tools/scripts/build-idx.ps1
# Generate docs/idx/IDX-CORPUS-0001.md from YAML front-matter + ROLE_TYPE
# Windows PowerShell 5.1 compatible
# COMPLIANCE TARGETS:
# - SPEC-DOC_STYLE-2215-0001: no BOM, LF-only, no trailing whitespace, exactly one final newline
# - IDX-CORPUS OUTPUT CONTRACT: doc_id_csv empty is "" (truly empty), separator is "," (no spaces)

$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$docsRoot = Join-Path $repoRoot 'docs'
$idxPath  = Join-Path $docsRoot 'idx\IDX-CORPUS-0001.md'

function To-Lf([string]$s) {
    if ($null -eq $s) { return '' }
    return ($s -replace "`r`n", "`n") -replace "`r", "`n"
}

function Get-FrontMatterMap([string]$content) {
    if ($content -notmatch "(?s)^---\s*\r?\n(.*?)\r?\n---\s*\r?\n") {
        return $null
    }

    $fm = $Matches[1]
    $map = @{}
    $currentKey = $null

    foreach ($line in ($fm -split "\r?\n")) {
        if ($line -match '^\s*#') { continue }

        # key: value  OR  key:
        if ($line -match '^\s*([A-Za-z0-9_]+)\s*:\s*(.*)\s*$') {
            $k = $Matches[1]
            $v = $Matches[2].Trim()
            $map[$k] = $v
            $currentKey = $k
            continue
        }

        # - value (YAML block list item)
        if ($currentKey -ne $null -and $line -match '^\s*-\s+(.*)$') {
            $val = $Matches[1].Trim()

            # Store list items in a comma-separated raw string WITHOUT spaces.
            # Normalize-DocIdCsv will canonicalize further.
            if (-not [string]::IsNullOrWhiteSpace($map[$currentKey])) {
                $map[$currentKey] += ",$val"
            } else {
                $map[$currentKey] = $val
            }
        }
    }

    return $map
}

function Normalize-DocIdCsv($raw) {
    # Returns: "" or "A,B" (deduped, preserves first-seen order)
    if ($null -eq $raw) { return '' }

    $items = @()

    if ($raw -is [System.Array]) {
        $items = @(
            $raw |
            ForEach-Object { "$_".Trim() } |
            Where-Object { $_ -ne '' -and $_ -ne '—' }
        )
    } else {
        $s = "$raw".Trim()
        if ([string]::IsNullOrWhiteSpace($s)) { return '' }
        if ($s -eq '—') { return '' }

        # [A, B] -> A, B
        if ($s.StartsWith('[') -and $s.EndsWith(']')) {
            $s = $s.Substring(1, $s.Length - 2)
        }

        $items = @(
            ($s -split '[,\r\n]+' ) |
            ForEach-Object { $_.Trim() } |
            Where-Object { $_ -ne '' -and $_ -ne '—' }
        )
    }

    if ($items.Count -eq 0) { return '' }

    $seen = New-Object 'System.Collections.Generic.HashSet[string]'
    $out  = New-Object 'System.Collections.Generic.List[string]'

    foreach ($it in $items) {
        if ($seen.Add($it)) { [void]$out.Add($it) }
    }

    return ($out -join ',')
}

function Get-RoleType([string]$content) {
    $regex = New-Object System.Text.RegularExpressions.Regex(
        "(?ms)^\s*##\s+LLM-INTENT\s*\r?\n.*?^\s*ROLE_TYPE\s*:\s*(?<rt>[A-Za-z0-9_\-]+)\s*$"
    )
    $m = $regex.Match($content)
    if ($m.Success) { return $m.Groups['rt'].Value.Trim() }
    return ''
}

function Normalize-RoleType([string]$rt) {
    if ([string]::IsNullOrWhiteSpace($rt)) { return '' }
    $allow = @('STATE','RULE','BIND','INTERFACE','INDEX')
    if ($allow -contains $rt) { return $rt }
    return "INVALID($rt)"
}

function Render-Cell([string]$v) {
    if ($null -eq $v) { return '' }
    $s = "$v".Trim()
    if ([string]::IsNullOrWhiteSpace($s)) { return '' }
    return $s
}

function Render-Row([object]$r) {
    # Single uniform style: no spaces anywhere inside the row
    $id   = Render-Cell $r.id
    $file = Render-Cell $r.file
    $cls  = Render-Cell $r.class
    $st   = Render-Cell $r.status
    $rt   = Render-Cell $r.role_type
    $inp  = Render-Cell $r.inputs
    $dep  = Render-Cell $r.depends_on

    return "|$id|$file|$cls|$st|$rt|$inp|$dep|"
}

$rows = @()

Get-ChildItem -Path $docsRoot -Recurse -Filter *.md | ForEach-Object {
    $full = $_.FullName
    $rel  = $full.Substring($repoRoot.Path.Length + 1) -replace '\\','/'

    $txt = Get-Content -Raw -Encoding utf8 -LiteralPath $full
    $fm  = Get-FrontMatterMap $txt
    if ($null -eq $fm) { return }

    $id = $fm['id']
    if ([string]::IsNullOrWhiteSpace($id)) { return }

    $class      = $fm['class']
    $status     = $fm['status']
    $inputs     = Normalize-DocIdCsv $fm['inputs']
    $depends_on = Normalize-DocIdCsv $fm['depends_on']
    $roleType   = Normalize-RoleType (Get-RoleType $txt)

    $rows += [PSCustomObject]@{
        id         = $id
        file       = $rel
        class      = if ($class)   { $class }   else { '' }
        status     = if ($status)  { $status }  else { '' }
        role_type  = $roleType
        inputs     = $inputs
        depends_on = $depends_on
    }
}

$header = @'
---
id: IDX-CORPUS-0001
title: >
  Corpus Registry
class: idx
status: draft
prefix: CORP
doc_language: en-US
inputs: []
depends_on: []
scope: >
  Нормативный реестр членства документов корпуса. Определяет, какие doc_id
  считаются частью корпуса, и предоставляет машиночитаемую таблицу навигации.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: normative corpus membership registry and navigation table
INPUTS: []
OUTPUTS: [registry_rows]
FORBIDDEN: [worldbuilding, prose, implicit_membership, rule_definition, state_definition]

## DEFINITIONS

[FACT][CORP-010] `registry_row` = запись таблицы с полями {id, file, class, status, role_type, inputs, depends_on}.
[FACT][CORP-020] `membership` = свойство документа считаться частью корпуса.
[FACT][CORP-030] `primary_key` = поле `id`.

## INVARIANTS

[DECISION][CORP-100] Document HAS membership IFF its `id` exists in Registry table; ELSE FAIL.
[DECISION][CORP-110] Any `depends_on` reference MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-115] Any `inputs` reference MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-120] Any document with `status: fixed` MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-130] `id` MUST be unique across rows; ELSE FAIL.
[DECISION][CORP-140] Registry table is the ONLY authoritative membership source; ELSE FAIL.

[FORBIDDEN][CORP-150] Implicit membership by folder presence.
[FORBIDDEN][CORP-160] Redefining rules or state inside this INDEX.
[FORBIDDEN][CORP-170] Narrative or descriptive prose.

## CONTENT

|id|file|class|status|role_type|inputs|depends_on|
|--|----|-----|------|---------|------|----------|
'@

$footer = @'
## USAGE / RESOLUTION

[DECISION][CORP-200] Tools generating AI_CONTEXT or performing lint MUST consume only rows of this table; ELSE FAIL.
[DECISION][CORP-210] Filename MUST equal `<id>.md`; ELSE FAIL.
[DECISION][CORP-220] Path column is informational and MUST NOT redefine membership.

## OUTPUT CONTRACT

~~~yaml
doc_id: IDX-CORPUS-0001
role_type: INDEX
export:
  column_types:
    id: doc_id
    file: path
    class: enum
    status: enum
    role_type: enum
    inputs: doc_id_csv
    depends_on: doc_id_csv
  column_encoding:
    doc_id_csv:
      separator: ","
      empty: ""
      trim: true
  columns:
    - id
    - file
    - class
    - status
    - role_type
    - inputs
    - depends_on
  primary_key: id
  rows_source: CONTENT
~~~

## FORBIDDEN

[FORBIDDEN][CORP-900] Using folder scan as corpus membership.
[FORBIDDEN][CORP-901] Consuming documents not present in this registry.
[FORBIDDEN][CORP-902] Treating any content outside the table in `## CONTENT` as registry data.
[FORBIDDEN][CORP-903] Using placeholders like "—" in CSV-typed columns.
[FORBIDDEN][CORP-904] Emitting spaces around separators in doc_id_csv (must be "," only).

## NON-NORMATIVE

(empty)
'@

# Build body rows (uniform formatting; empty cells are truly empty)
$bodyLines = @()
foreach ($r in $rows) {
    $bodyLines += (Render-Row $r)
}

# Normalize to LF and ensure exactly one final newline, no BOM
$content = (To-Lf($header)).TrimEnd("`n") + "`n" +
           (($bodyLines -join "`n").TrimEnd("`n")) + "`n" +
           (To-Lf($footer)).TrimEnd("`n") + "`n"

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($idxPath, $content, $utf8NoBom)

Write-Host ('IDX generated: ' + $idxPath)
