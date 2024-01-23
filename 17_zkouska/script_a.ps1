$tcpConnections = Get-NetTCPConnection -State Established

foreach ($connection in $tcpConnections) {
    $processId = $connection.OwningProcess
    $process = Get-Process -Id $processId -ErrorAction SilentlyContinue

    if ($process) {
        $properties = @{
            "LocalAddress" = $connection.LocalAddress
            "LocalPort"    = $connection.LocalPort
            "RemoteAddress"= $connection.RemoteAddress
            "RemotePort"   = $connection.RemotePort
            "State"        = $connection.State
            "ProcessName"  = $process.ProcessName
            "FilePath"     = $process.Path
        }

        $obj = New-Object PSObject -Property $properties
        Write-Output $obj
    }
}
