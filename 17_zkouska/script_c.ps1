function Get-USDCZKExchangeRate {
    $apiUrl = "https://open.er-api.com/v6/latest/USD"

    $response = Invoke-RestMethod -Uri $apiUrl -Method Get -TimeoutSec 10
    $usdToCzkRate = $response.rates.CZK
    $ustToEurRate = $response.rates.EUR

    Write-Output "Aktuální kurz USD/CZK: 1 USD = $usdToCzkRate CZK"
    Write-Output "Aktuální kurz USD/EUR: 1 USD = $ustToEurRate EUR"
}

Get-USDCZKExchangeRate

function Get-BTCUSDRate {
    $apiUrlBTC = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"
    $apiUrlTIA = "https://api.coingecko.com/api/v3/simple/price?ids=Celestia&vs_currencies=usd"

    $responseBTC = Invoke-RestMethod -Uri $apiUrlBTC -Method Get -TimeoutSec 10
    $responseTIA = Invoke-RestMethod -Uri $apiUrlTIA -Method Get -TimeoutSec 10
    $btcToUsdRate = $responseBTC.bitcoin.usd
    $tiaToUsdRate = $responseTIA.Celestia.usd

    Write-Output "Aktuální kurz BTC/USD: 1 BTC = $btcToUsdRate USD"
    Write-Output "Aktuální kurz TIA/USD: 1 BTC = $tiaToUsdRate USD"
}

Get-BTCUSDRate