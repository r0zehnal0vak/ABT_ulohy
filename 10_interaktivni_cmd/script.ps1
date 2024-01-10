function ShowDirectoryNavigation {
    $currentDirectory = Get-Location

    while ($true) {
        Write-Host "----------------------------"
        
        $directories = Get-ChildItem -Directory -Path $currentDirectory
        $Files = Get-ChildItem -File -Path $currentDirectory
        Write-Host "Number of Directories: $($directories.Count)"
        Write-Host "Number of Files: $($Files.Count)"

        $minFileSize = $Files | Measure-Object -Property Length -Minimum | Select-Object -ExpandProperty Minimum
        $maxFileSize = $Files | Measure-Object -Property Length -Maximum | Select-Object -ExpandProperty Maximum
        Write-Host "Min Size: $minFileSize bytes"
        Write-Host "Max Size: $maxFileSize bytes"

        Write-Host "----------------------------"

        Write-Host "Directories:"
        for ($i = 0; $i -lt $directories.Count; $i++) {
            Write-Host "$($i + 1). $($directories[$i].Name)"
        }

        Write-Host "----------------------------"

        Write-Host "Select directory [number], [U] to go back or exit [Q]"

        $input = Read-Host "Choice"

        if ($input -match '^[1-9][0-9]?$') {
            $selectedDirectory = $directories[$input - 1]
            $currentDirectory = $selectedDirectory.FullName
        }
        elseif ($input -eq 'U') {
            $currentDirectory = Split-Path -Path $currentDirectory -Parent
        }
        elseif ($input -eq 'Q') {
            return
        }
        else {
            Write-Host "Invalid input. Please try again."
            Start-Sleep -Seconds 2
        }
    }
}

ShowDirectoryNavigation