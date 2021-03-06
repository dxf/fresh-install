#Requires -RunAsAdministrator
if (-not ([Net.ServicePointManager]::SecurityProtocol).ToString().Contains([Net.SecurityProtocolType]::Tls12)) {
  [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol.toString() + ', ' + [Net.SecurityProtocolType]::Tls12
}
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$installscript = $PSScriptRoot+"\package_install.ps1"
& $installscript
$telescript = $PSScriptRoot+"\block-telemetry.ps1"
& $telescript
$dailyupdate = $PSScriptRoot+"\choco-daily-update.ps1"
& $dailyupdate
$controlpanel = $PSScriptRoot+"\AAA.ps1"
& $controlpanel
