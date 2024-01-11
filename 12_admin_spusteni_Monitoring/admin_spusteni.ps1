$adminRights = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $adminRights) {
    Write-Host "Skript byl spusten bez administratorskych prav."

    $scriptPath = $MyInvocation.MyCommand.Definition
    Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    exit
} else {
    Write-Host "Skript byl spusten s administratorskymi pravy."
    #sleep(10) # jinak se okno hned zavře
    Write-Host "Enter pro ukonceni skriptu..."
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}
