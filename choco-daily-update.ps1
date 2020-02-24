#Requires -RunAsAdministrator
<#
script to install packages from https://github.com/nadia-moon/chocolatey, and creates a scheduled daily task to update software
#>
mkdir c:\tempdl
cd C:\tempdl
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/nadia-moon/chocolatey/master/program_list.config" -OutFile "C:\tempdl\program_list.config"
choco install program_list.config -y
$Trigger= New-ScheduledTaskTrigger -At 10:00pm -Daily
$User= "NT AUTHORITY\SYSTEM"
$Action= New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "choco upgrade all -y"
Register-ScheduledTask -TaskName "daily_choco_update" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force
Remove-Item -Recurse -Force c:\tempdl
