# tools/scripts/build-idx.ps1
# Generate docs/08-idx/IDX-CORPUS-0001.md from YAML front-matter in docs//*.md
# Windows PowerShell 5.1 compatible

$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$docsRoot = Join-Path $repoRoot 'docs'
$idxPath  = Join-Path $docsRoot '08-idx\IDX-CORPUS-0001.md'

function Get-FrontMatterMap([string]$content) {
  if ($content -notmatch "(?s)^---\s*\r?\n(.*?)\r?\n---\s*\r?\n") { return $null }
  $fm = $Matches[1]

  $map = @{}
  foreach ($line in ($fm -split "\r?\n")) {
    if ($line -match '^\s*#') { continue }
    if ($line -match '^\s*([A-Za-z0-9_]+)\s*:\s*(.*)\s*$') {
      $k = $Matches[1]
      $v = $Matches[2].Trim()
      $map[$k] = $v
    }
  }
  return $map
}

function Normalize-Inputs([string]$inputsRaw) {
  if ([string]::IsNullOrWhiteSpace($inputsRaw)) { return '—' }

  $s = $inputsRaw.Trim()

  # inputs: [A, B, C] -> A,B,C
  if ($s.StartsWith('[') -and $s.EndsWith(']')) {
    $inner = $s.Substring(1, $s.Length - 2)
    $parts = $inner -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
    if ($parts.Count -eq 0) { return '—' }
    return ($parts -join ',')
  }

  return $s
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

  $class   = $fm['class']
  $status  = $fm['status']
  $version = $fm['version']
  $inputs  = Normalize-Inputs $fm['inputs']

  $rows += [PSCustomObject]@{
    id      = $id.Trim()
    file    = $rel
    class   = if ($class)   { $class.Trim() }   else { '' }
    status  = if ($status)  { $status.Trim() }  else { '' }
    version = if ($version) { $version.Trim() } else { '' }
    inputs  = $inputs
  }
}

# stable ordering
$rows = $rows | Sort-Object class, id

$header = @'
---
id: IDX-CORPUS-0001
title: >
  Corpus Registry
class: idx
status: draft
version: 0.1.0
inputs: []
depends_on: []
scope: >
  Реестр всех документов корпуса: роли, статусы, зависимости.
---

## RULES

- [DECISION][CORP-010] IDX-CORPUS is normative for corpus membership.
- [DECISION][CORP-011] A doc is considered part of the corpus IFF it is present in the Registry table.
- [DECISION][CORP-012] Lint MUST fail if:
  - any referenced `depends_on` id is missing from Registry, OR
  - any `status: fixed` doc is missing from Registry.

## Registry

| id | file | class | status | version | inputs | notes |
| -- | ---- | ----- | ------ | ------- | ------ | ----- |
'@ + "`r`n"

$body = ($rows | ForEach-Object {
  # notes intentionally empty for manual curation
  '| {0} | {1} | {2} | {3} | {4} | {5} | |' -f $_.id, $_.file, $_.class, $_.status, $_.version, $_.inputs
}) -join "`r`n"

# Write UTF-8 with BOM (чтобы Windows-инструменты не ломали кириллицу)
$utf8Bom = New-Object System.Text.UTF8Encoding($true)
[System.IO.File]::WriteAllText($idxPath, ($header + $body + "`r`n"), $utf8Bom)

Write-Host ('IDX generated: ' + $idxPath)
