# Vypi�te seznam nepou�it�ch ��t� a seznam uzam�en�ch ��t�:

$users = Get-WmiObject -Class Win32_UserAccount
$nepouziteUcty = $users | Where-Object { $_.Disabled -eq $false -and $_.Lockout -eq $false -and $_.LastLogon -lt $date }
$uzamceneUcty = $users | Where-Object { $_.Disabled -eq $false -and $_.Lockout -eq $true }

Write-Host "Nepou�it� ��ty:"
$nepouziteUcty | Select-Object Name
Write-Host "`nUzam�en� ��ty:"
$uzamceneUcty | Select-Object Name

# Cim rozhran�:

$users = Get-LocalUser
$nepouziteUcty = $users | Where-Object { $_.Enabled -eq $true -and $_.LastLogon -lt $date }
$uzamceneUcty = $users | Where-Object { $_.Enabled -eq $true -and $_.Lockout -eq $true }

Write-Host "Nepou�it� ��ty:"
$nepouziteUcty | Select-Object Name
Write-Host "Neuzam�en� ��ty:"
$uzamceneUcty | Select-Object Name

