# Vytvořte textový soubor obsahující text "Hello world." Pro předání parametrů použijte "splatting".
$fileParams = @{
    FilePath    = "C:\Users\KRoze\Desktop\Hello.txt"
    InputObject = "Hello world"
}
Out-File @fileParams

# Vypsání událostí z logu System typu "Chyba" z posledních 10 dní

$logParams = @{
    'LogName'     = 'System'
    'FilterXPath' = "*[System[Level=2]]"
}

$output = Get-WinEvent @logParams | Where-Object {$_.TimeCreated -ge (Get-Date).AddDays(-10)}
$output