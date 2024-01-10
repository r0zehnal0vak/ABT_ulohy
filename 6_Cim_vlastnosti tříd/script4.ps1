
# Vlastnosti t��dy umo��uj�c� spravovat tisk�rny:
Get-CimClass -ClassName Win32_Printer | Get-Member -MemberType Property

# Zm��te um�st�n� faxu:


$fax = Get-CimInstance -ClassName Win32_Printer | Where-Object { $_.Name -eq "Fax" }
$fax.Location = "C:\"
$fax | Set-CimInstance



# Zjist�te, jak se naz�v� v� disk C: a p��padn� ho p�ejmenujte na "Syst�m":


$diskC = Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DeviceID -eq "C:" }
$diskC.VolumeName 
$diskC.VolumeName = "System"
$diskC | Set-CimInstance