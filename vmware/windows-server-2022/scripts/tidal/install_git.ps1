# Tidal tool's version can only be cheked after restarting powershell
# Thus in this shell, instead of install_tidal_tools.ps1
Write-Host "++ Checking tidal version ++"
tidal version

# Install chocolatey
Write-Host "++ Install chocolatey ++"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install git
Write-Host "++ Install git ++"
choco install --yes git
