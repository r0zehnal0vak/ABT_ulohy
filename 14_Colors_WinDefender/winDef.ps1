Update-MpSignature # update DB

$thread = Get-MpThreatCatalog # Gets known threats from the definitions catalog 
$threadCount = $thread.Count

Write-Host "Celkový počet hrozeb: $threadCount"

