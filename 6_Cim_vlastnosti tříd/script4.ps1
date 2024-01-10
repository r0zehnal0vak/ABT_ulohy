
# Vlastnosti tøídy umožòující spravovat tiskárny:
Get-CimClass -ClassName Win32_Printer | Get-Member -MemberType Property

# Zmìòte umístìní faxu:


$fax = Get-CimInstance -ClassName Win32_Printer | Where-Object { $_.Name -eq "Fax" }
$fax.Location = "C:\"
$fax | Set-CimInstance



# Zjistìte, jak se nazývá váš disk C: a pøípadnì ho pøejmenujte na "Systém":


$diskC = Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DeviceID -eq "C:" }
$diskC.VolumeName 
$diskC.VolumeName = "System"
$diskC | Set-CimInstance