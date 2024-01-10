$Numlock = (Get-ItemProperty -Path 'Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard\' -Name "InitialKeyboardIndicators").InitialKeyboardIndicators

if ($Numlock -ne 2) {
    Set-ItemProperty -Path 'Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard\' -Name "InitialKeyboardIndicators" -Value 2
}

$regPath = 'HKCU:\Hrátky s PowerShellem'
New-Item -Path $regPath -Force

$registryInfo = @{
    UserAccount      = $env:USERNAME
    ComputerName     = $env:COMPUTERNAME
    CurrentDate      = Get-Date -Format "yyyy-MM-dd"
    PowerShellVersion = $PSVersionTable.PSVersion.ToString()
}

foreach ($entry in $registryInfo.GetEnumerator()) {
    Set-ItemProperty -Path $regPath -Name $entry.Key -Value $entry.Value
}

$registryInfo.GetEnumerator() | ForEach-Object {
    Write-Host "$($_.Key): $($_.Value)"
}