$adresar = "C:\Users\KRoze\Desktop\outlog"
$logSoubor = "C:\Users\KRoze\Desktop\outlog\outlog.txt"

function ZapisDoLogu ($obsah) {
    Add-Content -Path $logSoubor -Value $obsah
}

while ($true) {
    $soubory = Get-ChildItem -Path $adresar -File | Where-Object { $_.CreationTime -gt $posledniKontrola }
    
    foreach ($soubor in $soubory) {
        $jmenoSouboru = $soubor.Name
        $casVytvoreni = $soubor.CreationTime
        $informace = "Novy soubor vytvoren: $jmenoSouboru, Cas: $casVytvoreni"
        ZapisDoLogu $informace
    }

    $posledniKontrola = Get-Date
    Write-Host "Watching the directory..."
    Start-Sleep -Seconds 5
}