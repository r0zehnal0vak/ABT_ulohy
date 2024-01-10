# Vypište seznam nepoužitých úètù a seznam uzamèených úètù:

$users = Get-WmiObject -Class Win32_UserAccount
$nepouziteUcty = $users | Where-Object { $_.Disabled -eq $false -and $_.Lockout -eq $false -and $_.LastLogon -lt $date }
$uzamceneUcty = $users | Where-Object { $_.Disabled -eq $false -and $_.Lockout -eq $true }

Write-Host "Nepoužité úèty:"
$nepouziteUcty | Select-Object Name
Write-Host "`nUzamèené úèty:"
$uzamceneUcty | Select-Object Name

# Cim rozhraní:

$users = Get-LocalUser
$nepouziteUcty = $users | Where-Object { $_.Enabled -eq $true -and $_.LastLogon -lt $date }
$uzamceneUcty = $users | Where-Object { $_.Enabled -eq $true -and $_.Lockout -eq $true }

Write-Host "Nepoužité úèty:"
$nepouziteUcty | Select-Object Name
Write-Host "Neuzamèené úèty:"
$uzamceneUcty | Select-Object Name

