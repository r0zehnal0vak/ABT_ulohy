# Set-MpPreference -DisableRealtimeMonitoring $true
Update-MpSignature # aktualizace DB

$threats = Get-MpThreatCatalog
$threatCount = $threats.Count

Write-Host "Počet detekcí hrozeb: $threatCount" # počet různých hrozeb, které dokáže detekovat

$rozdelovac = $threats | ForEach-Object { $_.ThreatName.Split(':')[0] }
$hrozby = $rozdelovac | Group-Object | Sort-Object -Property Count -Descending
$typHrozby = $hrozby | Select-Object -First 5 # prvních 5 hrozeb

$typHrozbyNazvy = $typHrozby.Name
Write-Host "Nejčastější typy hrozeb: $typHrozbyNazvy"