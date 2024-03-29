function Start-jedna{
    $url = "https://www.novinky.cz"
    $html = Invoke-WebRequest -Uri $url
    $links = $html.Links | Where-Object { $_.Href -like "http*" } | Group-Object Href | Sort-Object Count -Descending

    foreach ($link in $links) {
        Write-Output "$($link.Count) - $($link.Name)"
    }

    $Zena_zdravi = $links | Where-Object { $_.Name -like "https://www.novinky.cz/sekce/zena-zdravi*" }
    Write-Output "Číslo sekce žena-zdraví: $($Zena_zdravi.Count)"
}
Start-jedna

function Start-dva{
    $url = "https://pbase.com/ydavid/utopiapark"
    $outputPath = "C:\Users\KRoze\Desktop\11"

    New-Item -ItemType Directory -Force -Path $outputPath

    $html = Invoke-WebRequest -Uri $url
    $imageUrls = $html.Images | Where-Object { $_.src -match "\.jpeg$" } | Select-Object -ExpandProperty src

    foreach ($imageUrl in $imageUrls) {
        $imageName = [System.IO.Path]::GetFileName($imageUrl)
        $outputFile = Join-Path $outputPath $imageName
        Invoke-WebRequest -Uri $imageUrl -OutFile $outputFile
    }

    Write-Host "Obrázky stáhnuty: $outputPath"
}
#Start-dva

function Start-tri{
    $apiUrl = "https://worldtimeapi.org/api/timezone/Europe/Prague"
    $jsonResponse = Invoke-RestMethod -Uri $apiUrl

    $currentTime = Get-Date($jsonResponse.utc_datetime)

    Set-Date -Date $currentTime
    Write-Output "Systémový čas byl změněn na $currentTime"
}
#Start-tri