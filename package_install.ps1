Invoke-WebRequest -Uri https://raw.githubusercontent.com/dxf/chocolatey/master/packages.config -OutFile packages.config
choco install packages.config
