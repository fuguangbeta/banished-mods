param([string]$Action = "apply", [string]$GameDir = "")
$ErrorActionPreference = "Stop"
if (-not $GameDir) { $GameDir = Read-Host "Enter the Banished folder path (contains Application-steam-x64.exe)" }
$exe = Join-Path $GameDir "Application-steam-x64.exe"
if (-not (Test-Path $exe)) { Write-Host "ERROR: Application-steam-x64.exe not found"; Read-Host "Press Enter to exit"; exit 1 }
$backup = $exe + ".orig_backup"
$off = 0x7C317
$b = [IO.File]::ReadAllBytes($exe)
if ($b.Length -lt ($off + 4)) { Write-Host "ERROR: file too small"; Read-Host "Press Enter"; exit 1 }
$cur = $b[$off..($off+3)]
if ($Action -eq "restore") {
  if (-not (Test-Path $backup)) { Write-Host "ERROR: backup not found"; Read-Host "Press Enter"; exit 1 }
  Copy-Item $backup $exe -Force
  Write-Host "Restored original executable from backup."
  Read-Host "Press Enter to exit"; exit 0
}
if ($cur[0] -eq 255 -and $cur[1] -eq 224 -and $cur[2] -eq 245 -and $cur[3] -eq 5) { Write-Host "Already patched (99999999). Nothing to do."; Read-Host "Press Enter"; exit 0 }
if (-not ($cur[0] -eq 63 -and $cur[1] -eq 66 -and $cur[2] -eq 15 -and $cur[3] -eq 0)) { Write-Host ("ERROR: unexpected bytes at 0x7C317: " + ($cur -join " ")); Write-Host "Probably a different game build. Nothing changed."; Read-Host "Press Enter"; exit 1 }
if (-not (Test-Path $backup)) { Copy-Item $exe $backup; Write-Host ("Backup created: " + $backup) }
$b[$off] = 255; $b[$off+1] = 224; $b[$off+2] = 245; $b[$off+3] = 5
[IO.File]::WriteAllBytes($exe, $b)
Write-Host "Patched OK. Resource limit max is now 99999999."
Read-Host "Press Enter to exit"