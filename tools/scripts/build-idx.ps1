# tools/scripts/build-idx.ps1
# Generate docs/idx/IDX-CORPUS-0001.md from YAML front-matter + ROLE_TYPE
# Windows PowerShell 5.1 compatible

$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$docsRoot = Join-Path $repoRoot 'docs'
$idxPath  = Join-Path $docsRoot 'idx\IDX-CORPUS-0001.md'

function Get-FrontMatterMap([string]$content) {
    if ($content -notmatch "(?s)^---\s*\r?\n(.*?)\r?\n---\s*\r?\n") {
        return $null
    }

    $fm = $Matches[1]
    $map = @{}
    $currentKey = $null

    foreach ($line in ($fm -split "\r?\n")) {
        if ($line -match '^\s*#') { continue }

        # 1. Ловим строку вида "key: value" (или просто "key:")
        if ($line -match '^\s*([A-Za-z0-9_]+)\s*:\s*(.*)\s*$') {
            $k = $Matches[1]
            $v = $Matches[2].Trim()
            $map[$k] = $v
            $currentKey = $k
        }
        # 2. Ловим строку списка "- value", если уже известен ключ
        elseif ($currentKey -ne $null -and $line -match '^\s*-\s+(.*)$') {
            $val = $Matches[1].Trim()
            
            # Добавляем к существующему значению через запятую.
            # Функция Normalize-DocIdCsv потом сама разберется с форматом.
            if (-not [string]::IsNullOrWhiteSpace($map[$currentKey])) {
                $map[$currentKey] += ", $val"
            } else {
                $map[$currentKey] = $val
            }
        }
    }

    return $map
}

function Normalize-DocIdCsv($raw) {
    # Accepts: $null | "" | "A,B" | "[A, B]" | array
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

        # Split by comma OR newline (extra safety)
        $items = @(
            ($s -split '[,\r\n]+' ) |
            ForEach-Object { $_.Trim() } |
            Where-Object { $_ -ne '' -and $_ -ne '—' }
        )
    }

    if ($items.Count -eq 0) { return '' }

    # Dedup, preserve order of first appearance
    $seen = New-Object 'System.Collections.Generic.HashSet[string]'
    $out  = New-Object 'System.Collections.Generic.List[string]'

    foreach ($it in $items) {
        if ($seen.Add($it)) { [void]$out.Add($it) }
    }

    return ($out -join ',')
}

function Get-RoleType([string]$content) {
    # Extract ROLE_TYPE from ## LLM-INTENT block
    $regex = New-Object System.Text.RegularExpressions.Regex(
        "(?ms)^\s*##\s+LLM-INTENT\s*\r?\n.*?^\s*ROLE_TYPE\s*:\s*(?<rt>[A-Za-z0-9_\-]+)\s*$"
    )

    $m = $regex.Match($content)
    if ($m.Success) {
        return $m.Groups['rt'].Value.Trim()
    }

    return ''
}

function Normalize-RoleType([string]$rt) {
    if ([string]::IsNullOrWhiteSpace($rt)) { return '' }
    $allow = @('STATE','RULE','BIND','INTERFACE','INDEX','PLAN','REGISTRY')
    if ($allow -contains $rt) { return $rt }
    return "INVALID($rt)"
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
    $version    = $fm['version']
    $inputs     = Normalize-DocIdCsv $fm['inputs']
    $depends_on = Normalize-DocIdCsv $fm['depends_on']
    $roleType   = Normalize-RoleType (Get-RoleType $txt)

    $rows += [PSCustomObject]@{
        id         = $id.Trim()
        file       = $rel
        class      = if ($class)   { $class.Trim() }   else { '' }
        status     = if ($status)  { $status.Trim() }  else { '' }
        version    = if ($version) { $version.Trim() } else { '' }
        role_type  = $roleType
        inputs     = $inputs
        depends_on = $depends_on
    }
}

# NOTE: git неважен — оставляем порядок файлового обхода (как есть).
# Если захочешь “читаемый” порядок — раскомментируй:
# $rows = $rows | Sort-Object class, id

$header = @'
---
id: IDX-CORPUS-0001
title: >
  Corpus Registry
class: idx
status: draft
version: 0.2.0
prefix: CORP
doc_language: ru-RU
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

[FACT][CORP-010] `registry_row` = запись таблицы с полями {id, file, class, status, version, role_type, inputs, depends_on, notes}.
[FACT][CORP-020] `membership` = свойство документа считаться частью корпуса.
[FACT][CORP-030] `primary_key` = поле `id`.

## INVARIANTS

[DECISION][CORP-100] Document HAS membership IFF its `id` exists in Registry table; ELSE FAIL.
[DECISION][CORP-110] Any `depends_on` reference MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-120] Any document with `status: fixed` MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-130] `id` MUST be unique across rows; ELSE FAIL.
[DECISION][CORP-140] Registry table is the ONLY authoritative membership source; ELSE FAIL.

[FORBIDDEN][CORP-150] Implicit membership by folder presence.
[FORBIDDEN][CORP-160] Redefining rules or state inside this INDEX.
[FORBIDDEN][CORP-170] Narrative or descriptive prose.

## CONTENT

| id | file | class | status | version | role_type | inputs | depends_on |
| -- | ---- | ----- | ------ | ------- | --------- | ------ | ---------- |
'@
$header += "`r`n"

$body = ($rows | ForEach-Object {
    '| {0} | {1} | {2} | {3} | {4} | {5} | {6} | {7} |' -f `
        $_.id,
        $_.file,
        $_.class,
        $_.status,
        $_.version,
        $_.role_type,
        $_.inputs,
        $_.depends_on
}) -join "`r`n"

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
    version: semver
    role_type: enum
    inputs: doc_id_csv
    depends_on: doc_id_csv
    notes: text
  column_encoding:
    doc_id_csv:
      separator: ","
      empty: ""
  columns:
    - id
    - file
    - class
    - status
    - version
    - role_type
    - inputs
    - depends_on
    - notes
  primary_key: id
  rows_source: CONTENT
~~~

## FORBIDDEN

[FORBIDDEN][CORP-900] Using folder scan as corpus membership.
[FORBIDDEN][CORP-901] Consuming documents not present in this registry.
[FORBIDDEN][CORP-902] Treating comments or prose as registry data.
[FORBIDDEN][CORP-903] Using placeholders like "—" in CSV-typed columns.

## NON-NORMATIVE

(empty)
'@

# Write UTF-8 with BOM (чтобы Windows-инструменты не ломали кириллицу)
$utf8Bom = New-Object System.Text.UTF8Encoding($true)
[System.IO.File]::WriteAllText(
    $idxPath,
    ($header + $body + "`r`n" + $footer),
    $utf8Bom
)

Write-Host ('IDX generated: ' + $idxPath)
