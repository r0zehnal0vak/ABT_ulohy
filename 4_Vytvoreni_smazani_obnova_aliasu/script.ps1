# aliasy
New-Alias -Name np -Value notepad.exe
New-Alias -Name ct -Value control.exe

$aliasObject = @{
    np = "notepad.exe"
    ct = "control.exe"
}

# Export
$aliasObject | ConvertTo-Json | Out-File -FilePath "C:\Users\KRoze\Desktop\json.json"

# Smazání np a ct
Remove-Alias -Name np -ErrorAction SilentlyContinue
Remove-Alias -Name ct -ErrorAction SilentlyContinue

# Import
$importedAliases = Get-Content -Raw -Path "C:\Users\KRoze\Desktop\json.json" | ConvertFrom-Json

# Obnovení aliasů
foreach ($alias in $importedAliases.PSObject.Properties) {
    $aliasName = $alias.Name
    $aliasValue = $alias.Value
    New-Alias -Name $aliasName -Value $aliasValue
}