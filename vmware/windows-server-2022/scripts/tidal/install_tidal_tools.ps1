Write-Host "++ Downloading tidal tools ++"
Invoke-WebRequest -Uri https://get.tidal.sh/tidal-win-64-latest -OutFile C:\Users\tidal\tidal-win-64.msi
Start-Sleep -Seconds 10

Write-Host "++ Installing tidal tools for" $env:UserName "user ++"
Start-Process C:\Users\tidal\tidal-win-64.msi -ArgumentList "/quiet"
Start-Sleep -Seconds 10
