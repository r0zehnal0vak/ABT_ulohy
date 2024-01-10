# Setřiďte znaky v textu “Kobyla má malý bok” vzestupně dle abecedy.

$text = "Kobyla má malý bok"
$sortedText = $text.ToLower().ToCharArray() | Sort-Object
Write-Host $sortedText


# Vygenerujte 10 náhodných čísel mezi 10 a 100 vypište je spolu s jejich druhou mocninou. 
# Výpis proveďte do dvou sloupců, kde v prvním bude hodnota čísla a v druhém jeho mocnina. 
# Oba sloupce budou zarovnané, např. první sloupec od první pozice doprava a druhý od šesté pozice doprava.

$randomNumbers = Get-Random -InputObject (10..100) -Count 10
foreach ($number in $randomNumbers) {
    $square = $number * $number
    Write-Host ("{0,1} {1,5}" -f $number, $square)
}

# Stáhněte si knihu z adresy https://www.gutenberg.org/ebooks/308 ve formátu UTF-8. 
# Vypište seznam znaků, které se v textu vyskytují, a to sestupně podle počtu výskytů.

$cestaKKnize = "C:\Users\KRoze\Desktop\kniha.txt"
$obsahKnihy = Get-Content -Path $cestaKKnize -Raw

$znakyAVyskyty = @{}
foreach ($znak in $obsahKnihy.ToCharArray()) {
    if ($znakyAVyskyty.ContainsKey($znak)) {
        $znakyAVyskyty[$znak]++
    } else {
        $znakyAVyskyty[$znak] = 1
    }
}


$sestupneSerazeno = $znakyAVyskyty.GetEnumerator() | Sort-Object Value -Descending

foreach ($polozka in $sestupneSerazeno) {
    Write-Host ("{0}: {1}" -f $polozka.Key, $polozka.Value)
}