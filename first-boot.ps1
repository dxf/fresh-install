#Requires -RunAsAdministrator
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$installscript = $PSScriptRoot+"\package_install.ps1"
& $installscript
$telescript = $PSScriptRoot+"\block-telemetry.ps1"
& $telescript
$dailyupdate = $PSScriptRoot+"\choco-daily-update.ps1"
& $dailyupdate
