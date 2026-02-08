<#
.SYNOPSIS
  Rename all *-OSA-* markdown files to *-FSSU-* (filesystem only).
#>

param(
  [switch]$Apply,
  [switch]$IncludeDraft
)

$ErrorActionPreference = 'Stop'

$root = Get-Location

$targets = @(
  Join-Path $root 'docs'
)

if ($IncludeDraft) {
  $targets += (Join-Path $root 'DRAFT')
}

$files = foreach ($dir in $targets) {
  if (Test-Path $dir) {
    Get-ChildItem $dir -Recurse -File -Filter '*.md'
  }
}

$candidates = $files | Where-Object {
  $_.Name -like '*-OSA-*'
}

if (-not $candidates) {
  Write-Host 'No OSA files found.' -ForegroundColor Yellow
  return
}

Write-Host 'Rename plan:' -ForegroundColor Cyan

$plan = foreach ($f in $candidates) {
  $newName = $f.Name -replace '-OSA-', '-FSSU-'
  $newPath = Join-Path $f.DirectoryName $newName

  Write-Host "  $($f.Name) -> $newName"

  if ($Apply) {
    git mv $f.FullName $newPath
  }
}

if (-not $Apply) {
  Write-Host "`nDry run only. Re-run with -Apply to execute." -ForegroundColor Yellow
} else {
  Write-Host "`nRename completed." -ForegroundColor Green
}
