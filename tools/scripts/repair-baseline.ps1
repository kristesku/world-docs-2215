# tools/scripts/repair-baseline.ps1
param(
  [Parameter(Mandatory=$true)][string]$Path
)

$txt = Get-Content -Raw -Encoding utf8 $Path

# 1) убрать локальные file:// ссылки вида [[123]](file://...)
$txt = [regex]::Replace(
  $txt,
  '\[\[\d+\]\]\(file://[^\)]*\)',
  ''
)

# 2) URL-decode percent-encoding (%D0%.. etc)
$txt = [regex]::Replace($txt, '(%[0-9A-Fa-f]{2})+', {
  param($m)
  try { [System.Uri]::UnescapeDataString($m.Value) } catch { $m.Value }
})

# 3) подчистить двойные пустые строки (умеренно)
$txt = [regex]::Replace($txt, "(\r?\n){3,}", "`r`n`r`n")

Set-Content -Encoding utf8 $Path -Value $txt
Write-Host "OK: repaired $Path"
