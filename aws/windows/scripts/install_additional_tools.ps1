Write-Host "++ Install chrome ++"
choco install -y googlechrome
Start-Sleep -Seconds 40

# Find more information on this here:
# https://github.com/tidalmigrations/machine_stats/tree/master/windows#authentication-error
Write-Host "++ Set trustedhosts to all ++"
Set-Item WSMan:localhost\client\trustedhosts -value * -Force
