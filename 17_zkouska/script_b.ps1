$souborCesta = "C:\Users\KRoze\Desktop\17\soubor.txt"

$pristupovaPrava = (Get-Acl -Path $souborCesta).Access
Write-Host "Přístupová práva k souboru:"
$pristupovaPrava | Format-Table -AutoSize
Write-Host " "

$sddl = (Get-Acl -Path $souborCesta).Sddl
Write-Host "Celý SDDL:"
$sddl
Write-Host " "

$vlastnik = (Get-Acl -Path $souborCesta).Owner
Write-Host "Jsem vlastník?: $vlastnik"
Write-Host " "

$sidVlastnika = (New-Object System.Security.Principal.NTAccount($vlastnik)).Translate([System.Security.Principal.SecurityIdentifier]).Value
Write-Host "SID vlastníka: $sidVlastnika"
Write-Host " "

$ucetJmeno = (New-Object System.Security.Principal.SecurityIdentifier("S-1-5-32-544")).Translate([System.Security.Principal.NTAccount]).Value
Write-Host "Jméno účtu pro SID S-1-5-32-544: $ucetJmeno"
