function Get-InstalledSoftwareFromRegistry { # z REGISTRU
    $softwareList = @()
    
    $registryPaths = @(
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall",
        "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
    )

    foreach ($registryPath in $registryPaths) {
        $softwareList += Get-Item $registryPath #|
            Get-ItemProperty |
            Where-Object { $_.DisplayName -and $_.UninstallString } |
            Select-Object DisplayName, DisplayVersion, Publisher, UninstallString
    }

    return $softwareList
}

function Get-InstalledSoftwareFromWMI { # Get-WmiObject
    $softwareList = Get-WmiObject -Query "SELECT * FROM Win32_Product" #|
        Select-Object Name, Version, Vendor

    return $softwareList
}

function Get-InstalledSoftwareFromProgramFiles { # Get-Item
    $softwareList = Get-ChildItem -Path "$env:SystemDrive\Program Files", "$env:SystemDrive\Program Files (x86)" #|
        Where-Object { $_.PSIsContainer } |
        ForEach-Object {
            $software = $_.Name
            $version = (Get-Item $_.FullName).VersionInfo.ProductVersion
            $vendor = (Get-Item $_.FullName).VersionInfo.CompanyName

            [PSCustomObject]@{
                Name = $software
                Version = $version
                Vendor = $vendor
            }
        }

    return $softwareList
}

$registrySoftware = Get-InstalledSoftwareFromRegistry
$wmIsoftware = Get-InstalledSoftwareFromWMI
$programFilesSoftware = Get-InstalledSoftwareFromProgramFiles

$allSoftware = $registrySoftware + $wmIsoftware + $programFilesSoftware # sjednocení všech souborů
$uniqueSoftware = $allSoftware | Sort-Object -Property Name -Unique # odstranění duplikátů
$uniqueSoftware | Format-Table -AutoSize # výpis