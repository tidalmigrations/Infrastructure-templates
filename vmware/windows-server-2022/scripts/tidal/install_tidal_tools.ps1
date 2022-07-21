Write-Host "++ Downloading tidal tools ++"
Invoke-WebRequest -Uri https://get.tidal.sh/tidal-win-64-latest -OutFile C:\tidal-win-64.msi
Start-Sleep -Seconds 10

Write-Host "++ Installing tidal tools ++"
Start-Process C:\tidal-win-64.msi -ArgumentList "/quiet"
Start-Sleep -Seconds 10
