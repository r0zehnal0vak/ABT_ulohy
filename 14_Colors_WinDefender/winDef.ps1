Update-MpSignature # aktualizace

$threats = Get-MpThreatCatalog
$threatCount = $threats.Count

Write-Host "Počet detekcí hrozeb: $threatCount" # počet různých hrozeb, které dokáže detekovat

$mostDetectedThreats = $threats| Sort-Object -Property DetectionCount -Descending | Select-Object -First 1 # Typ nejvíce detekované hrozby
Write-Host "Nejvíce detekovaná hrozba: $($mostDetectedThreats.ThreatName)"
