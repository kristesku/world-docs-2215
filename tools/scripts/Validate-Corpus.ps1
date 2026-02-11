<#
.SYNOPSIS
    Validates AI_CONTEXT.md corpus against its architectural specifications.
.DESCRIPTION
    Implements lint gates from:
      - SPEC-DOC_STYLE-2215-0001  (document style, skeleton, statements, language)
      - SPEC-DOC_ID-2215-0001     (doc_id grammar, namespaces, families)
      - IDX-CORPUS-0001           (registry membership, dependency integrity)
    Parses the monolithic AI_CONTEXT.md, extracts embedded documents,
    and runs all decidable checks.
.PARAMETER Path
    Relative path to AI_CONTEXT.md file.
.EXAMPLE
    .\Validate-Corpus.ps1 -Path .\AI_CONTEXT.md
#>

[CmdletBinding(DefaultParameterSetName = 'ByRoot')]
param(
    [Parameter(Mandatory = $true, Position = 0, ParameterSetName = 'ByRoot')]
    [string]$Root,

    [Parameter(Mandatory = $true, Position = 0, ParameterSetName = 'ByFile')]
    [string]$Path,

    [Parameter(ParameterSetName = 'ByRoot')]
    [string[]]$Include = @('*.md'),

    [Parameter(ParameterSetName = 'ByRoot')]
    [string[]]$Exclude = @('AI_CONTEXT.md')
)

Set-StrictMode -Version 2
$ErrorActionPreference = 'Stop'

# ─────────────────────────────────────────────
# Constants from specs
# ─────────────────────────────────────────────

$AllowedFamilies = @('SSOT','BASELINE','CANON','SPEC','PROTOCOL','IDX','REG','PLAN','SCENE')

$ClassFamilyMapping = @{
    'ssot'     = 'SSOT'
    'baseline' = 'BASELINE'
    'canon'    = 'CANON'
    'spec'     = 'SPEC'
    'protocol' = 'PROTOCOL'
    'idx'      = 'IDX'
    'registry' = 'REG'
    'plan'     = 'PLAN'
    'scene'    = 'SCENE'
}

$FamilyScopeSchemas = @{
    'SSOT'     = @{ Pattern = 'SSOT-<topic>-<scenario>-<year>-<seq>'; Segments = 5; HasYear = $true }
    'BASELINE' = @{ Pattern = 'BASELINE-<topic>-<year>-<seq>'; Segments = 4; HasYear = $true }
    'CANON'    = @{ Pattern = 'CANON-<topic>-<scope>-<year>-<seq>'; Segments = 5; HasYear = $true }
    'SPEC'     = @{ Pattern = 'SPEC-<topic>-<year>-<seq>'; Segments = 4; HasYear = $true }
    'PROTOCOL' = @{ Pattern = 'PROTOCOL-<topic>-<year>-<seq>'; Segments = 4; HasYear = $true }
    'IDX'      = @{ Pattern = 'IDX-<topic>-<seq>'; Segments = 3; HasYear = $false }
    'REG'      = @{ Pattern = 'REG-<topic>-<year>-<seq>'; Segments = 4; HasYear = $true }
    'PLAN'     = @{ Pattern = 'PLAN-<topic>-<year>-<seq>'; Segments = 4; HasYear = $true }
    'SCENE'    = @{ Pattern = 'SCENE-<topic>-<scope>-<year>-<seq>'; Segments = 5; HasYear = $true }
}

$SkeletonH2 = @(
    'LLM-INTENT'
    'DEFINITIONS'
    'INVARIANTS'
    'CONTENT'
    'USAGE / RESOLUTION'
    'OUTPUT CONTRACT'
    'FORBIDDEN'
    'NON-NORMATIVE'
)

$AllowedRoleTypes = @('STATE','RULE','BIND','INTERFACE','INDEX')

$RoleTagConstraints = @{
    'STATE'     = @{ ContentTags = @('STATE','DECISION','FORBIDDEN'); DefTags = @('FACT') }
    'RULE'      = @{ ContentTags = @('RULE','DECISION','FORBIDDEN'); DefTags = @('FACT') }
    'BIND'      = @{ ContentTags = @('BIND','DECISION','FORBIDDEN'); DefTags = @('FACT') }
    'INTERFACE' = @{ ContentTags = @('DECISION','FORBIDDEN'); DefTags = @('FACT') }
    'INDEX'     = @{ ContentTags = @('DECISION','FORBIDDEN'); DefTags = @('FACT') }
}

$ForbiddenSofteners = @('usually','as a rule','generally','rather','maybe','possibly')

# Regexes
$DocIdCharsetRe          = '^[A-Z0-9_-]+$'
$DocIdSeqRe              = '-([0-9]{4})$'
$TopicRe                 = '^[A-Z0-9]+(?:_[A-Z0-9]+)*$'
$StatementLineRe         = '^\[(FACT|ASSUMPTION|PROJECTION|DECISION|FORBIDDEN|UNKNOWN|STATE|RULE|BIND)\]\[([A-Z0-9_]+-[0-9]{3}[A-Z]?)\]\s.+'
$DocIdRefTokenRe         = '\b([A-Z0-9_]+(?:-[A-Z0-9_]+)+-[0-9]{4})\b'
$H2Re                    = '^##\s+(.+)$'
$H3Re                    = '^###\s.+$'
$H4PlusRe                = '^#{4,}\s'
$FencedBlockRe           = '^~~~'
$EnumParenRe             = '\b[0-9]+\)'
$EllipsisRe              = '\.\.\.|…'
$YamlDelimiterRe         = '^---$'
$ConsecutiveUnderscoreRe = '__'
$H3NumericDotRe          = '^(?:###\s[0-9]+\.\s.+|###\s[0-9]+\.[0-9]+(?:\.[0-9]+)*\s.+)$'
$H3NumericParenRe        = '^###\s[0-9]+\)\s'

# ─────────────────────────────────────────────
# Findings accumulator
# ─────────────────────────────────────────────

$script:Findings = New-Object System.Collections.ArrayList

function Add-Finding {
    param(
        [string]$Severity,
        [string]$Gate,
        [string]$DocId,
        [string]$Message,
        [int]$Line = 0
    )
    $obj = New-Object PSObject -Property @{
        Severity = $Severity
        Gate     = $Gate
        DocId    = $DocId
        Message  = $Message
        Line     = $Line
    }
    [void]$script:Findings.Add($obj)
}

# ─────────────────────────────────────────────
# 1) Read and parse the monolithic file
# ─────────────────────────────────────────────

Write-Host "`n=== Corpus Validator ===" -ForegroundColor Cyan

$Documents = @{}

function Parse-DocumentText {
    param(
        [string]$FilePath,
        [string]$Text
    )

    # Normalize line endings
    $Text = $Text -replace "`r`n", "`n"
    $lines = @($Text -split "`n")

    # Parse YAML front-matter
    $bodyStartIdx = 0
    $inYaml = $false
    $yamlLines = @()

    for ($i = 0; $i -lt $lines.Length; $i++) {
        $l = $lines[$i]
        if ((-not $inYaml) -and ($l -match '^---\s*$') -and ($i -lt 5)) {
            $inYaml = $true
            $bodyStartIdx = $i + 1
            continue
        }
        if ($inYaml -and ($l -match '^---\s*$')) {
            $bodyStartIdx = $i + 1
            $inYaml = $false
            break
        }
        if ($inYaml) { $yamlLines += $l }
    }

    # Minimal YAML parser (key-value + block lists)
    $yaml = @{}
    $currentKey = $null
    $currentList = $null

    foreach ($yl in $yamlLines) {
        if (($yl -match '^\s*-\s+(.+)$') -and $currentKey) {
            if ($null -eq $currentList) { $currentList = @() }
            $currentList += $Matches[1].Trim()
            continue
        }

        if (($null -ne $currentList) -and ($null -ne $currentKey)) {
            $yaml[$currentKey] = $currentList
            $currentList = $null
        }

        if ($yl -match '^(\w[\w_]*)\s*:\s*(.*)$') {
            $currentKey = $Matches[1].Trim()
            $val = $Matches[2].Trim()
            if ($val -eq '>' -or $val -eq '|' -or $val -eq '') {
                $yaml[$currentKey] = ''
            }
            elseif ($val -eq '[]') {
                $yaml[$currentKey] = @()
                $currentList = $null
                $currentKey = $null
            }
            else {
                $yaml[$currentKey] = $val
                $currentList = $null
            }
        }
        elseif (($yl -match '^\s{2,}\S') -and ($null -ne $currentKey) -and ($null -eq $currentList)) {
            $existing = $yaml[$currentKey]
            if ($existing -is [string]) {
                $yaml[$currentKey] = ($existing + ' ' + $yl.Trim()).Trim()
            }
        }
    }

    if (($null -ne $currentList) -and ($null -ne $currentKey)) {
        $yaml[$currentKey] = $currentList
    }

    $docId = if ($yaml.ContainsKey('id')) { ($yaml['id'].ToString().Trim()) } else { $FilePath }

    $bodyLines = @()
    if ($bodyStartIdx -lt $lines.Length) {
        $bodyLines = @($lines[$bodyStartIdx..($lines.Length - 1)])
    }

    return (New-Object PSObject -Property @{
        FilePath     = $FilePath
        DocId        = $docId
        Yaml         = $yaml
        Lines        = $lines
        BodyStartIdx = $bodyStartIdx
        BodyLines    = $bodyLines
    })
}

if ($PSCmdlet.ParameterSetName -eq 'ByRoot') {
    $resolvedRoot = Resolve-Path $Root -ErrorAction Stop
    $rootPath = $resolvedRoot.Path

    $files = Get-ChildItem -Path $rootPath -Recurse -File |
        Where-Object {
            $nameOk = $false
            foreach ($pat in $Include) { if ($_.Name -like $pat) { $nameOk = $true; break } }
            if (-not $nameOk) { return $false }

            foreach ($ex in $Exclude) { if ($_.Name -like $ex) { return $false } }
            return $true
        } |
        Sort-Object FullName

    if ($files.Count -eq 0) {
        Write-Error "No matching files found under $Root (Include=$($Include -join ', '))"
        return
    }

    Write-Host "Source: $rootPath" -ForegroundColor DarkGray
    Write-Host "Files found: $($files.Count)`n" -ForegroundColor DarkGray

    $rootUri = New-Object System.Uri(($rootPath.TrimEnd('\') + '\'))

    foreach ($f in $files) {
        $text = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
        $fileUri = New-Object System.Uri($f.FullName)
        $rel = $rootUri.MakeRelativeUri($fileUri).ToString().Replace('\','/')
        $doc = Parse-DocumentText -FilePath $rel -Text $text

        if ($Documents.ContainsKey($doc.DocId)) {
            Add-Finding 'ERROR' 'CORP-000' $doc.DocId "Duplicate doc_id '$($doc.DocId)' (files: '$($Documents[$doc.DocId].FilePath)' and '$rel')"
            continue
        }
        $Documents[$doc.DocId] = $doc
    }

    Write-Host "Documents loaded: $($Documents.Count)`n"
}
else {
    # Backward compatible: parse AI_CONTEXT.md
    $resolvedPath = Resolve-Path $Path -ErrorAction Stop
    $rawContent = [System.IO.File]::ReadAllText($resolvedPath.Path, [System.Text.Encoding]::UTF8)

    $fileBlockRe = '(?s)<file\s+path="([^"]+)">\s*~~~markdown\s*\r?\n(.*?)~~~\s*</file>'
    $allMatches = [regex]::Matches($rawContent, $fileBlockRe)

    if ($allMatches.Count -eq 0) {
        Write-Error "No embedded documents found in $Path. Is this a valid AI_CONTEXT.md?"
        return
    }

    Write-Host "Source: $resolvedPath" -ForegroundColor DarkGray
    Write-Host "Documents found: $($allMatches.Count)`n" -ForegroundColor DarkGray

    foreach ($m in $allMatches) {
        $filePath = $m.Groups[1].Value
        $rawBody  = $m.Groups[2].Value

        $doc = Parse-DocumentText -FilePath $filePath -Text $rawBody

        if ($Documents.ContainsKey($doc.DocId)) {
            Add-Finding 'ERROR' 'CORP-000' $doc.DocId "Duplicate doc_id '$($doc.DocId)' (paths: '$($Documents[$doc.DocId].FilePath)' and '$filePath')"
            continue
        }
        $Documents[$doc.DocId] = $doc
    }
}

# ─────────────────────────────────────────────
# 2) Parse IDX-CORPUS registry
# ─────────────────────────────────────────────

$IdxRows = @{}
$IdxDoc = $null
foreach ($d in $Documents.Values) {
    if ($d.DocId -like 'IDX-CORPUS*') { $IdxDoc = $d; break }
}

if ($null -ne $IdxDoc) {
    $inTable = $false
    $headers = @()
    foreach ($tline in $IdxDoc.BodyLines) {
        if ($tline -match '^\|id\|') {
            $headers = @(($tline.Trim('|') -split '\|') | ForEach-Object { $_.Trim() })
            $inTable = $true
            continue
        }
        if ($inTable -and ($tline -match '^\|--')) { continue }
        if ($inTable -and ($tline -match '^\|')) {
            $cells = @(($tline.Trim('|') -split '\|') | ForEach-Object { $_.Trim() })
            $row = @{}
            $maxCI = [Math]::Min($headers.Length, $cells.Length)
            for ($ci = 0; $ci -lt $maxCI; $ci++) {
                $row[$headers[$ci]] = $cells[$ci]
            }
            if ($row.ContainsKey('id') -and $row['id']) {
                $IdxRows[$row['id']] = $row
            }
        }
        elseif ($inTable -and ($tline -notmatch '^\|')) {
            $inTable = $false
        }
    }
}

$CorpusIds = @{}
foreach ($k in $IdxRows.Keys) { $CorpusIds[$k] = $true }

Write-Host "IDX-CORPUS rows: $($IdxRows.Count)" -ForegroundColor DarkGray

# ─────────────────────────────────────────────
# 3) Corpus-level checks
# ─────────────────────────────────────────────

# 3a. Every parsed document must be in IDX
foreach ($dk in @($Documents.Keys)) {
    if (-not $CorpusIds.ContainsKey($dk)) {
        Add-Finding 'ERROR' 'CORP-100' $dk 'Document not found in IDX-CORPUS registry'
    }
}

# 3b. Every IDX row must have a corresponding document
foreach ($ik in @($IdxRows.Keys)) {
    if (-not $Documents.ContainsKey($ik)) {
        Add-Finding 'ERROR' 'CORP-100' $ik 'IDX-CORPUS row references document not present in loaded sources'
    }
}

# 3c. All inputs/depends_on in IDX must point to existing IDX rows
foreach ($row in $IdxRows.Values) {
    $rowId = $row['id']
    foreach ($field in @('inputs','depends_on')) {
        $val = $row[$field]
        if ($val -and $val.Trim()) {
            $refs = @($val -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
            foreach ($ref in $refs) {
                if (-not $CorpusIds.ContainsKey($ref)) {
                    Add-Finding 'ERROR' 'CORP-110' $rowId "IDX $field reference '$ref' not found in registry"
                }
            }
        }
    }
}

# 3d. Prefix uniqueness across corpus
$prefixMap = @{}
foreach ($doc in $Documents.Values) {
    $pfx = $doc.Yaml['prefix']
    if ($pfx) {
        $pfx = $pfx.Trim()
        if ($prefixMap.ContainsKey($pfx)) {
            Add-Finding 'ERROR' 'STYLE-051A' $doc.DocId "Prefix '$pfx' duplicated (also in $($prefixMap[$pfx]))"
        }
        else {
            $prefixMap[$pfx] = $doc.DocId
        }
    }
}

# 3e. DAG acyclicity check on inputs + depends_on (STYLE-200B)
$script:_dagVisited  = @{}
$script:_dagInStack  = @{}      # set: node -> true
$script:_dagPath     = New-Object System.Collections.Generic.List[string]
$script:_dagHasCycle = $false
$script:_dagCyclePath = @()     # array of nodes in cycle order (A -> ... -> A)

function Visit-Node {
    param([string]$Node, [hashtable]$Graph)

    if ($script:_dagHasCycle) { return }

    if ($script:_dagInStack.ContainsKey($Node)) {
        # Extract cycle from current path: from first occurrence of Node to end, then close the loop
        $idx = $script:_dagPath.IndexOf($Node)
        if ($idx -ge 0) {
            $cycle = @()
            for ($i = $idx; $i -lt $script:_dagPath.Count; $i++) { $cycle += $script:_dagPath[$i] }
            $cycle += $Node
            $script:_dagCyclePath = $cycle
        }
        else {
            $script:_dagCyclePath = @($Node, $Node)
        }
        $script:_dagHasCycle = $true
        return
    }

    if ($script:_dagVisited.ContainsKey($Node)) { return }

    $script:_dagInStack[$Node] = $true
    [void]$script:_dagPath.Add($Node)

    if ($Graph.ContainsKey($Node)) {
        foreach ($gdep in @($Graph[$Node])) {
            Visit-Node -Node $gdep -Graph $Graph
            if ($script:_dagHasCycle) { return }
        }
    }

    # pop
    [void]$script:_dagPath.RemoveAt($script:_dagPath.Count - 1)
    $script:_dagInStack.Remove($Node)
    $script:_dagVisited[$Node] = $true
}

$depGraph = @{}
foreach ($doc in $Documents.Values) {
    $deps = @()
    $inp = $doc.Yaml['inputs']
    $dpon = $doc.Yaml['depends_on']
    if ($inp -is [array]) { $deps += $inp }
    if ($dpon -is [array]) { $deps += $dpon }
    $cleaned = @($deps | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    if ($cleaned.Length -gt 0) {
        $depGraph[$doc.DocId] = $cleaned
    }
}

foreach ($node in @($depGraph.Keys)) {
    Visit-Node -Node $node -Graph $depGraph
    if ($script:_dagHasCycle) { break }
}
if ($script:_dagHasCycle) {
    $cycleText = if ($script:_dagCyclePath.Count -gt 0) { ($script:_dagCyclePath -join ' -> ') } else { '(unknown cycle)' }
    Add-Finding 'ERROR' 'STYLE-200B' 'CORPUS' "Dependency graph has cycle: $cycleText"
}

# ─────────────────────────────────────────────
# 4) Per-document checks
# ─────────────────────────────────────────────

foreach ($doc in $Documents.Values) {
    $docId = $doc.DocId
    $yaml  = $doc.Yaml
    $body  = @($doc.BodyLines)
    $bodyLen = $body.Length

    # ── DOC_ID checks ──

    if ($docId -notmatch $DocIdCharsetRe) {
        Add-Finding 'ERROR' 'DOCID-040' $docId 'doc_id contains invalid characters (must match ^[A-Z0-9_-]+$)'
    }

    if ($docId -match $ConsecutiveUnderscoreRe) {
        Add-Finding 'ERROR' 'DOCID-041' $docId 'doc_id contains consecutive underscores'
    }

    if ($docId -match $DocIdSeqRe) {
        $seqInt = [int]$Matches[1]
        if ($seqInt -lt 1 -or $seqInt -gt 9999) {
            Add-Finding 'ERROR' 'DOCID-051' $docId "seq_int $seqInt out of range [1, 9999]"
        }
    }
    else {
        Add-Finding 'ERROR' 'DOCID-050' $docId 'doc_id does not end with -NNNN (4-digit sequence)'
    }

    $segments = @($docId -split '-')
    $family = $segments[0]
    $segCount = $segments.Length

    if ($family -notin $AllowedFamilies) {
        Add-Finding 'ERROR' 'DOCID-060' $docId "Family '$family' not in allowed_families"
    }

    $docClass = ''
    if ($yaml.ContainsKey('class')) { $docClass = $yaml['class'].Trim() }
    if ($docClass -and $ClassFamilyMapping.ContainsKey($docClass)) {
        $expectedFamily = $ClassFamilyMapping[$docClass]
        if ($expectedFamily -ne $family) {
            Add-Finding 'ERROR' 'DOCID-061' $docId "Class '$docClass' maps to family '$expectedFamily', but doc_id family is '$family'"
        }
    }
    elseif ($docClass) {
        Add-Finding 'WARN' 'DOCID-061' $docId "Class '$docClass' has no mapping in class_family_mapping"
    }

    if ($FamilyScopeSchemas.ContainsKey($family)) {
        $schema = $FamilyScopeSchemas[$family]
        if ($segCount -lt $schema.Segments) {
            Add-Finding 'WARN' 'DOCID-072' $docId "doc_id has $segCount segments, schema '$($schema.Pattern)' expects >= $($schema.Segments)"
        }
        if ($schema.HasYear -and ($segCount -ge $schema.Segments)) {
            $yearSeg = $segments[$segCount - 2]
            if ($yearSeg -ne '2215') {
                Add-Finding 'ERROR' 'DOCID-073' $docId "Year segment is '$yearSeg', expected '2215'"
            }
        }
    }

    if ($segCount -ge 2) {
        $topic = $segments[1]
        if ($topic -notmatch $TopicRe) {
            Add-Finding 'ERROR' 'DOCID-071' $docId "Topic segment '$topic' does not match ^[A-Z0-9]+(?:_[A-Z0-9]+)*$"
        }
    }

    # ── YAML FRONT-MATTER checks ──

    $requiredKeys = @('id','title','class','status','scope','inputs','depends_on')
    foreach ($rk in $requiredKeys) {
        if (-not $yaml.ContainsKey($rk)) {
            Add-Finding 'ERROR' 'STYLE-131' $docId "Missing required YAML key: '$rk'"
        }
    }

    if (-not $yaml.ContainsKey('references')) {
        Add-Finding 'WARN' 'STYLE-132A' $docId "Missing YAML key 'references' (should be present, use [] if empty)"
    }

    $status = ''
    if ($yaml.ContainsKey('status')) { $status = $yaml['status'].Trim() }
    if ($status -and ($status -notin @('draft','fixed','deprecated'))) {
        Add-Finding 'ERROR' 'STYLE-135' $docId "Invalid status '$status' (must be draft|fixed|deprecated)"
    }
    if (($status -eq 'deprecated') -and (-not $yaml.ContainsKey('superseded_by'))) {
        Add-Finding 'ERROR' 'STYLE-135A' $docId "Status is 'deprecated' but 'superseded_by' is missing"
    }

    $yamlId = ''
    if ($yaml.ContainsKey('id')) { $yamlId = $yaml['id'].Trim() }
    if ($yamlId -and ($yamlId -notmatch '^[A-Z0-9_-]+$')) {
        Add-Finding 'ERROR' 'STYLE-133' $docId 'YAML id contains invalid characters'
    }

    # Gather dependency lists (always arrays via @())
    $inputsList = @()
    $dependsList = @()
    $referencesList = @()
    if ($yaml.ContainsKey('inputs') -and ($yaml['inputs'] -is [array])) {
        $inputsList = @($yaml['inputs'] | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    }
    if ($yaml.ContainsKey('depends_on') -and ($yaml['depends_on'] -is [array])) {
        $dependsList = @($yaml['depends_on'] | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    }
    if ($yaml.ContainsKey('references') -and ($yaml['references'] -is [array])) {
        $referencesList = @($yaml['references'] | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    }

    # Lookup hashes for intersection
    $inputsHash  = @{}; foreach ($x in $inputsList)    { $inputsHash[$x] = $true }
    $dependsHash = @{}; foreach ($x in $dependsList)   { $dependsHash[$x] = $true }
    $refsHash    = @{}; foreach ($x in $referencesList) { $refsHash[$x] = $true }

    # STYLE-139A: inputs ∩ depends_on = empty
    foreach ($x in $inputsList) {
        if ($dependsHash.ContainsKey($x)) {
            Add-Finding 'ERROR' 'STYLE-139A' $docId "inputs and depends_on overlap: '$x'"
            break
        }
    }

    # STYLE-139D: pairwise disjoint
    foreach ($x in $inputsList) {
        if ($refsHash.ContainsKey($x)) {
            Add-Finding 'ERROR' 'STYLE-139D' $docId "inputs and references overlap: '$x'"
            break
        }
    }
    foreach ($x in $dependsList) {
        if ($refsHash.ContainsKey($x)) {
            Add-Finding 'ERROR' 'STYLE-139D' $docId "depends_on and references overlap: '$x'"
            break
        }
    }

    # STYLE-200A: all dependency IDs exist in corpus
    $allDepIds = @($inputsList) + @($dependsList) + @($referencesList)
    foreach ($depId in $allDepIds) {
        if ($depId -and (-not $CorpusIds.ContainsKey($depId)) -and (-not $Documents.ContainsKey($depId))) {
            Add-Finding 'ERROR' 'STYLE-200A' $docId "Dependency '$depId' not found in corpus"
        }
    }

    # STYLE-132: sorted lexicographically
    if ($inputsList.Length -gt 1) {
        $sorted = @($inputsList | Sort-Object)
        for ($si = 0; $si -lt $inputsList.Length; $si++) {
            if ($inputsList[$si] -ne $sorted[$si]) {
                Add-Finding 'WARN' 'STYLE-132' $docId 'inputs list is not sorted lexicographically'
                break
            }
        }
    }
    if ($dependsList.Length -gt 1) {
        $sorted = @($dependsList | Sort-Object)
        for ($si = 0; $si -lt $dependsList.Length; $si++) {
            if ($dependsList[$si] -ne $sorted[$si]) {
                Add-Finding 'WARN' 'STYLE-132' $docId 'depends_on list is not sorted lexicographically'
                break
            }
        }
    }
    if ($referencesList.Length -gt 1) {
        $sorted = @($referencesList | Sort-Object)
        for ($si = 0; $si -lt $referencesList.Length; $si++) {
            if ($referencesList[$si] -ne $sorted[$si]) {
                Add-Finding 'WARN' 'STYLE-132A' $docId 'references list is not sorted lexicographically'
                break
            }
        }
    }

    # ── SKELETON checks ──

    $h2Sections = @()
    $h2Lines = @()
    for ($li = 0; $li -lt $bodyLen; $li++) {
        if ($body[$li] -match $H2Re) {
            $h2Sections += $Matches[1].Trim()
            $h2Lines += $li
        }
    }
    $h2Count = $h2Sections.Length

    $skeletonRequired = @($SkeletonH2[0..6])
    $missingH2 = @($skeletonRequired | Where-Object { $_ -notin $h2Sections })
    if ($missingH2.Length -gt 0) {
        Add-Finding 'ERROR' 'STYLE-020' $docId "Missing mandatory H2 sections: $($missingH2 -join ', ')"
    }

    $expectedOrder = @($SkeletonH2 | Where-Object { $_ -in $h2Sections })
    $actualOrder   = @($h2Sections | Where-Object { $_ -in $SkeletonH2 })
    $orderOk = $true
    $minLen = [Math]::Min($expectedOrder.Length, $actualOrder.Length)
    for ($oi = 0; $oi -lt $minLen; $oi++) {
        if ($expectedOrder[$oi] -ne $actualOrder[$oi]) {
            $orderOk = $false
            break
        }
    }
    if (-not $orderOk) {
        Add-Finding 'ERROR' 'STYLE-029' $docId 'H2 sections are out of order'
    }

    foreach ($h in $h2Sections) {
        if ($h -notin $SkeletonH2) {
            Add-Finding 'ERROR' 'STYLE-033' $docId "Extra H2 section: '## $h'"
        }
    }

    # ── Build section map ──
    $sectionMap = @{}
    for ($si = 0; $si -lt $h2Count; $si++) {
        $sStart = $h2Lines[$si] + 1
        $sEnd = if ($si -lt ($h2Count - 1)) { $h2Lines[$si + 1] - 1 } else { $bodyLen - 1 }
        $sectionMap[$h2Sections[$si]] = @{ Start = $sStart; End = $sEnd }
    }

    # ── LLM-INTENT checks ──
    $roleType = ''
    if ($sectionMap.ContainsKey('LLM-INTENT')) {
        $sec = $sectionMap['LLM-INTENT']
        $intentLines = @()
        for ($li = $sec.Start; $li -le $sec.End; $li++) {
            if (($li -lt $bodyLen) -and $body[$li].Trim()) { $intentLines += $body[$li] }
        }

        if ($intentLines.Length -gt 20) {
            Add-Finding 'ERROR' 'STYLE-035' $docId "LLM-INTENT exceeds 20 lines ($($intentLines.Length))"
        }

        $intentKeys = @('ROLE_TYPE','SCOPE','INPUTS','OUTPUTS','FORBIDDEN')
        $foundKeys = @()
        foreach ($il in $intentLines) {
            foreach ($ik in $intentKeys) {
                if ($il -match "^${ik}:\s*(.*)") {
                    $foundKeys += $ik
                    if ($ik -eq 'ROLE_TYPE') { $roleType = $Matches[1].Trim() }
                }
            }
        }
        $missingIK = @($intentKeys | Where-Object { $_ -notin $foundKeys })
        if ($missingIK.Length -gt 0) {
            Add-Finding 'ERROR' 'STYLE-036' $docId "LLM-INTENT missing keys: $($missingIK -join ', ')"
        }

        if ($roleType -and ($roleType -notin $AllowedRoleTypes)) {
            Add-Finding 'ERROR' 'STYLE-102' $docId "Invalid ROLE_TYPE: '$roleType'"
        }
    }

    if (-not $roleType) {
        foreach ($bl in $body) {
            if ($bl -match '^ROLE_TYPE:\s*(\S+)') {
                $roleType = $Matches[1].Trim()
                break
            }
        }
    }

    # ── H3 / H4+ checks ──
    $normativeSections = @('LLM-INTENT','DEFINITIONS','INVARIANTS','CONTENT','USAGE / RESOLUTION','OUTPUT CONTRACT','FORBIDDEN')

    for ($li = 0; $li -lt $bodyLen; $li++) {
        $line = $body[$li]

        if ($line -match $H4PlusRe) {
            Add-Finding 'ERROR' 'STYLE-097' $docId 'H4+ heading forbidden' ($li + 1)
        }

        if ($line -match $H3Re) {
            $inSection = ''
            foreach ($sName in @($sectionMap.Keys)) {
                $sr = $sectionMap[$sName]
                if (($li -ge $sr.Start) -and ($li -le $sr.End)) {
                    $inSection = $sName
                    break
                }
            }
            if ($inSection -and ($inSection -notin @('CONTENT','NON-NORMATIVE'))) {
                Add-Finding 'ERROR' 'STYLE-095' $docId "H3 heading in section '$inSection' (allowed only in CONTENT/NON-NORMATIVE)" ($li + 1)
            }
            if ($line -match $H3NumericParenRe) {
                Add-Finding 'ERROR' 'STYLE-099' $docId 'H3 heading with N) prefix forbidden' ($li + 1)
            }
            if (($line -match '^###\s[0-9]') -and ($line -notmatch $H3NumericDotRe)) {
                Add-Finding 'WARN' 'STYLE-099A' $docId 'Numeric H3 heading does not match N. format' ($li + 1)
            }
        }
    }

    # ── Per-line checks with fenced-block tracking ──
    $inFenced = $false
    $currentSection = ''

    for ($li = 0; $li -lt $bodyLen; $li++) {
        $line = $body[$li]

        foreach ($sName in @($sectionMap.Keys)) {
            $sr = $sectionMap[$sName]
            if ($li -eq ($sr.Start - 1)) { $currentSection = $sName }
        }

        if ($line -match $FencedBlockRe) {
            $inFenced = -not $inFenced
            continue
        }
        if ($inFenced) { continue }

        if (($line -match $YamlDelimiterRe) -and $currentSection) {
            Add-Finding 'WARN' 'STYLE-034' $docId "YAML delimiter '---' in body (section: $currentSection)" ($li + 1)
        }

        $isNorm = ($currentSection -in $normativeSections) -and ($currentSection -ne 'OUTPUT CONTRACT')

        if ($isNorm -and $line.Trim() -and ($line -match $EllipsisRe)) {
            Add-Finding 'WARN' 'STYLE-123' $docId "Ellipsis in normative section '$currentSection'" ($li + 1)
        }

        # Tag-to-role
        if ($isNorm -and ($line -match '^\[(FACT|ASSUMPTION|PROJECTION|DECISION|FORBIDDEN|UNKNOWN|STATE|RULE|BIND)\]\[')) {
            $tag = $Matches[1]
            if ($roleType -and $RoleTagConstraints.ContainsKey($roleType)) {
                $cstr = $RoleTagConstraints[$roleType]
                $cTags = @($cstr.ContentTags)
                $dTags = @($cstr.DefTags)

                if ($currentSection -eq 'DEFINITIONS') {
                    if ($tag -notin $dTags) {
                        Add-Finding 'ERROR' 'STYLE-044' $docId "Tag [$tag] not allowed in DEFINITIONS for ROLE_TYPE=$roleType" ($li + 1)
                    }
                }
                elseif ($currentSection -in @('CONTENT','INVARIANTS','USAGE / RESOLUTION','FORBIDDEN')) {
                    if (($tag -notin $cTags) -and ($tag -notin $dTags)) {
                        Add-Finding 'ERROR' 'STYLE-044' $docId "Tag [$tag] not allowed in $currentSection for ROLE_TYPE=$roleType" ($li + 1)
                    }
                }
            }
        }

        # Softeners
        if ($isNorm -and ($line -match '^\[')) {
            foreach ($soft in $ForbiddenSofteners) {
                if ($line -match "\b$([regex]::Escape($soft))\b") {
                    Add-Finding 'WARN' 'STYLE-060' $docId "Forbidden softener '$soft'" ($li + 1)
                }
            }
        }

        # Enum N) check
        if ($isNorm -and ($line -match '^\[') -and ($line -match $EnumParenRe)) {
            Add-Finding 'WARN' 'STYLE-056C' $docId 'Paren enumeration N) found (use N.)' ($li + 1)
        }
    }

    # ── OUTPUT CONTRACT ──
    if ('OUTPUT CONTRACT' -notin $h2Sections) {
        Add-Finding 'ERROR' 'STYLE-110' $docId 'Missing ## OUTPUT CONTRACT section'
    }
    elseif ($sectionMap.ContainsKey('OUTPUT CONTRACT')) {
        $ocSec = $sectionMap['OUTPUT CONTRACT']
        $hasYaml = $false
        $ocEnd = [Math]::Min($ocSec.End, $bodyLen - 1)
        for ($li = $ocSec.Start; $li -le $ocEnd; $li++) {
            if (($body[$li] -match '^~~~yaml') -or (($body[$li] -match '^~~~\s*$') -and ($li -gt $ocSec.Start))) {
                $hasYaml = $true
                break
            }
        }
        if (-not $hasYaml) {
            Add-Finding 'WARN' 'STYLE-111' $docId 'OUTPUT CONTRACT has no fenced YAML block'
        }
    }

    # ── Language checks ──
    if (-not $yaml.ContainsKey('doc_language')) {
        Add-Finding 'WARN' 'STYLE-065' $docId "Missing 'doc_language' in YAML"
    }
    else {
        $docLang = $yaml['doc_language'].Trim()
        if ($docLang -notin @('ru-RU','en-US')) {
            Add-Finding 'ERROR' 'STYLE-065' $docId "doc_language '$docLang' not allowed (ru-RU|en-US)"
        }
    }

    if (($docClass -in @('protocol','scene')) -and (-not $yaml.ContainsKey('prose_language'))) {
        Add-Finding 'WARN' 'STYLE-066' $docId "Class '$docClass' should declare prose_language: ru-RU"
    }

    # ── Prefix checks ──
    $prefix = $null
    if ($yaml.ContainsKey('prefix')) { $prefix = $yaml['prefix'].Trim() }
    if (-not $prefix) {
        $foundPrefixes = @{}
        $inFencedPfx = $false
        $curSecPfx = ''
        for ($li = 0; $li -lt $bodyLen; $li++) {
            $line = $body[$li]

            # track current H2 section
            foreach ($sName in @($sectionMap.Keys)) {
                $sr = $sectionMap[$sName]
                if ($li -eq ($sr.Start - 1)) { $curSecPfx = $sName }
            }

            if ($line -match $FencedBlockRe) { $inFencedPfx = -not $inFencedPfx; continue }
            if ($inFencedPfx) { continue }
            if ($curSecPfx -eq 'NON-NORMATIVE') { continue }

            if ($line -match '^\[(?:FACT|ASSUMPTION|PROJECTION|DECISION|FORBIDDEN|UNKNOWN|STATE|RULE|BIND)\]\[([A-Z0-9_]+)-[0-9]{3}') {
                $sp = $Matches[1]
                $cur = 0
                if ($foundPrefixes.ContainsKey($sp)) { $cur = $foundPrefixes[$sp] }
                $foundPrefixes[$sp] = $cur + 1
            }
        }
        if ($foundPrefixes.Count -eq 0) {
            Add-Finding 'WARN' 'STYLE-051' $docId 'No prefix declared and no statements found to infer from'
        }
        elseif ($foundPrefixes.Count -gt 1) {
            Add-Finding 'WARN' 'STYLE-051' $docId "No prefix declared and multiple prefixes: $($foundPrefixes.Keys -join ', ')"
        }
        else {
            $prefix = @($foundPrefixes.Keys)[0]
        }
    }

    # ── Statement ID consistency ──
    if ($prefix) {
        $stmtIds = @{}
        $inFencedStmt = $false
        $curSecStmt = ''

        for ($li = 0; $li -lt $bodyLen; $li++) {
            $line = $body[$li]

            foreach ($sName in @($sectionMap.Keys)) {
                $sr = $sectionMap[$sName]
                if ($li -eq ($sr.Start - 1)) { $curSecStmt = $sName }
            }

            if ($line -match $FencedBlockRe) { $inFencedStmt = -not $inFencedStmt; continue }
            if ($inFencedStmt) { continue }
            if ($curSecStmt -eq 'NON-NORMATIVE') { continue }

            if ($line -match $StatementLineRe) {
                $stmtId = $Matches[2]
                $stmtPfx = @($stmtId -split '-')[0]
                if ($stmtPfx -ne $prefix) {
                    Add-Finding 'WARN' 'STYLE-051' $docId "Statement '$stmtId' uses prefix '$stmtPfx', expected '$prefix'"
                }
                if ($stmtIds.ContainsKey($stmtId)) {
                    Add-Finding 'ERROR' 'STYLE-050' $docId "Duplicate statement ID: '$stmtId'"
                }
                $stmtIds[$stmtId] = $true
            }
        }
    }

    # ── STYLE-200C: undeclared doc_id references ──
    $declaredDeps = @{}
    foreach ($d2 in $allDepIds) { if ($d2) { $declaredDeps[$d2] = $true } }
    $declaredDeps[$docId] = $true

    $inFenced2 = $false
    $curSec2 = ''
    for ($li = 0; $li -lt $bodyLen; $li++) {
        $line = $body[$li]
        foreach ($sName in @($sectionMap.Keys)) {
            $sr = $sectionMap[$sName]
            if ($li -eq ($sr.Start - 1)) { $curSec2 = $sName }
        }
        if ($line -match $FencedBlockRe) { $inFenced2 = -not $inFenced2; continue }
        if ($inFenced2) { continue }
        if ($curSec2 -notin $normativeSections) { continue }

        $refMatches = [regex]::Matches($line, $DocIdRefTokenRe)
        foreach ($rm in $refMatches) {
            $refToken = $rm.Groups[1].Value
            if (($refToken -match '-[0-9]{3}[A-Z]?$') -and ($refToken -notmatch '-[0-9]{4}$')) { continue }
            if (-not $declaredDeps.ContainsKey($refToken)) {
                Add-Finding 'WARN' 'STYLE-200C' $docId "doc_id ref '$refToken' not in inputs/depends_on/references" ($li + 1)
            }
        }
    }

    # ── IDX cross-check ──
    if ($IdxRows.ContainsKey($docId)) {
        $idxRow = $IdxRows[$docId]

        if ($idxRow.ContainsKey('class') -and ($idxRow['class'] -ne $docClass)) {
            Add-Finding 'ERROR' 'IDX-CROSS' $docId "IDX class='$($idxRow['class'])' vs YAML class='$docClass'"
        }

        $idxStatus = ''
        if ($idxRow.ContainsKey('status')) { $idxStatus = $idxRow['status'] }
        if ($idxStatus -and ($idxStatus -ne $status)) {
            Add-Finding 'WARN' 'IDX-CROSS' $docId "IDX status='$idxStatus' vs YAML status='$status'"
        }

        $idxRole = ''
        if ($idxRow.ContainsKey('role_type')) { $idxRole = $idxRow['role_type'] }
        if ($idxRole -and $roleType -and ($idxRole -ne $roleType)) {
            Add-Finding 'ERROR' 'IDX-CROSS' $docId "IDX role_type='$idxRole' vs ROLE_TYPE='$roleType'"
        }

        # Inputs match
        $idxInputs = @()
        if ($idxRow.ContainsKey('inputs') -and $idxRow['inputs'].Trim()) {
            $idxInputs = @($idxRow['inputs'] -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ } | Sort-Object)
        }
        $yamlInpSorted = @($inputsList | Sort-Object)
        if (($yamlInpSorted -join ',') -ne ($idxInputs -join ',')) {
            $onlyY = @($yamlInpSorted | Where-Object { $_ -notin $idxInputs }) -join ', '
            $onlyI = @($idxInputs | Where-Object { $_ -notin $yamlInpSorted }) -join ', '
            $msg = 'inputs mismatch YAML vs IDX.'
            if ($onlyY) { $msg += " Only YAML: $onlyY." }
            if ($onlyI) { $msg += " Only IDX: $onlyI." }
            Add-Finding 'WARN' 'IDX-CROSS' $docId $msg
        }

        # Depends_on match
        $idxDeps = @()
        if ($idxRow.ContainsKey('depends_on') -and $idxRow['depends_on'].Trim()) {
            $idxDeps = @($idxRow['depends_on'] -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ } | Sort-Object)
        }
        $yamlDepSorted = @($dependsList | Sort-Object)
        if (($yamlDepSorted -join ',') -ne ($idxDeps -join ',')) {
            $onlyY = @($yamlDepSorted | Where-Object { $_ -notin $idxDeps }) -join ', '
            $onlyI = @($idxDeps | Where-Object { $_ -notin $yamlDepSorted }) -join ', '
            $msg = 'depends_on mismatch YAML vs IDX.'
            if ($onlyY) { $msg += " Only YAML: $onlyY." }
            if ($onlyI) { $msg += " Only IDX: $onlyI." }
            Add-Finding 'WARN' 'IDX-CROSS' $docId $msg
        }
    }

    # ── STYLE-135B: no deps on deprecated docs ──
    foreach ($depId in $allDepIds) {
        if ($depId -and $Documents.ContainsKey($depId)) {
            $depDoc = $Documents[$depId]
            $depSt = ''
            if ($depDoc.Yaml.ContainsKey('status')) { $depSt = $depDoc.Yaml['status'].Trim() }
            if ($depSt -eq 'deprecated') {
                Add-Finding 'ERROR' 'STYLE-135B' $docId "References deprecated document '$depId'"
            }
        }
    }
}

# ─────────────────────────────────────────────
# 5) Summary
# ─────────────────────────────────────────────

$totalFindings = $script:Findings.Count
$errors = @($script:Findings | Where-Object { $_.Severity -eq 'ERROR' })
$warns  = @($script:Findings | Where-Object { $_.Severity -eq 'WARN' })
$errCount  = $errors.Length
$warnCount = $warns.Length

Write-Host "`n--- RESULTS ---`n" -ForegroundColor Cyan

if ($totalFindings -eq 0) {
    Write-Host 'ALL CHECKS PASSED' -ForegroundColor Green
}
else {
    $byGate = @($script:Findings | Group-Object Gate | Sort-Object Name)

    foreach ($group in $byGate) {
        $gItems = @($group.Group)
        $gSev = $gItems[0].Severity
        $color = if ($gSev -eq 'ERROR') { 'Red' } else { 'Yellow' }
        Write-Host ("`n  [$($group.Name)] ($($gItems.Length) finding(s))") -ForegroundColor $color
        $show = @($gItems | Select-Object -First 10)
        foreach ($f in $show) {
            $loc = if ($f.Line -gt 0) { ":$($f.Line)" } else { '' }
            Write-Host "    $($f.Severity) | $($f.DocId)$loc | $($f.Message)"
        }
        if ($gItems.Length -gt 10) {
            Write-Host "    ... and $($gItems.Length - 10) more" -ForegroundColor DarkGray
        }
    }

    Write-Host "`n--- SUMMARY ---" -ForegroundColor Cyan
    Write-Host "  Documents: $($Documents.Count)"
    $errColor  = if ($errCount -gt 0) { 'Red' } else { 'Green' }
    $warnColor = if ($warnCount -gt 0) { 'Yellow' } else { 'Green' }
    Write-Host "  Errors:    $errCount" -ForegroundColor $errColor
    Write-Host "  Warnings:  $warnCount" -ForegroundColor $warnColor
}

Write-Host ''

if ($errCount -gt 0) { exit 1 }
exit 0