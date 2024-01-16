$filterFailure = @{
    LogName='Security'
    Id=4625
}
$filterSuccess =@{
    LogName='Security'
    Id=4624
}
$successEvents = Get-WinEvent -FilterHashtable $filterSuccess -MaxEvents 10
$failureEvents = Get-WinEvent -FilterHashtable $filterFailure -MaxEvents 10

Write-Host "Úspěšná přihlášení:"
foreach ($event in $successEvents) {
    $loginTypeMatch = $event.Message -match "Typ přihlášení:\s+(\d+)"
    if ($loginTypeMatch -and $matches[1] -eq "2") {
        Write-Host "Event ID: $($event.Id)"
        Write-Host "Time: $($event.TimeCreated)"
    }
}
Write-Host "------------------------------------------------------------------"

Write-Host "Neúspěšná přihlášení:"
foreach ($event in $failureEvents) {
    Write-Host "Event ID: $($event.Id)"
    Write-Host "Time: $($event.TimeCreated)"
    $failureInfo = $event.Message -match "Důvod selhání:(.*)" | Out-Null ; $matches[0].Trim()
    $failureInfo2 = $event.Message -match "Stav:(.*)" | Out-Null ; $matches[0].Trim()
    Write-Host $failureInfo
    Write-Host $failureInfo2
}
