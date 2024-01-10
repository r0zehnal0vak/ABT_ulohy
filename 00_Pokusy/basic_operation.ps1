# if statement

#$podminka = $true
#if ($podminka){
#    Write-Output "Podminka je true"
#}


# -eq 2  Equal to (==)
# -ne 4  Not equal to (!=)
# -gt 2  Greater-than (>)
# -ge 5  Greater-than or equal to (>=)
# -lt 10  Less-than (<)
# -le 5  Less-than or equal to (<=)

# funkce a if statement + while cyklus
function Start-NumberGuesser {
    Write-Host "Uhodni číslo 1-100"
    $secretNumber = Get-Random -Minimum 1 -Maximum 100
    ${attempts} = 0
    $guessedNumber = $null

    do {
        ${attempts}++ # inkrementace++ jde i -- 
        $guessedNumber = Read-Host "Pokus ${attempts}: Zadej svuj typ (1-100)"

        if (-not $guessedNumber -match '^\d+$') { # kontrola znaku # not - condition not met
            Write-Host "Vloz validni cislo!!"
            continue
        }

        $guessedNumber = [int]$guessedNumber

        if ($guessedNumber -lt $secretNumber) { # <
            Write-Host "Prilis nizke! Zkus znovu."
        }
        elseif ($guessedNumber -gt $secretNumber) { # >
            Write-Host "Prilis vysoke! Zkus znovu."
        }
        else {
            Write-Host "Vyhra! Uhodnul si cislo $secretNumber na ${attempts} pokus!"
        }
    } while ($guessedNumber -ne $secretNumber) # != Dokud se nerovná, když se rovná cyklus pokračuje
}

Start-NumberGuesser

# "MyString" -like "*String" # Match using the wildcard character (*)
# "MyString" -notlike "Other*" # Does not match using the wildcard character (*)
# "MyString" -match '^String$' # Matches a string using regular expressions
# "MyString" -notmatch '^Other$' # Does not match a string using regular expressions

function Start-StringComparsion{
    #$string = "pes"
    $string = Read-Host "Zadej slovo"
    $retezec = Read-Host "Zadej retezec (*retezec*)"
    if($string -like "*$retezec*"){
        Write-Host "Slovo $string obsahuje řetězec *$retezec*"
    }else{
        Write-Host "Slovo $string neobsahuje řetězec *$retezec*"
    }
}

# Start-StringComparsion

# For-each a výpis Array + order

function Start-Ordering{
    $names = @( "Aaron", "Aaron", "Bernie", "Charlie", "Danny" )

    $names | Sort-Object
    #$names | sort
    foreach ($element in $name) {Write-Host $element} # podle abecedy -descend naopak
}
# Start-Ordering

function Start-ForCyklus{
    for($i = 0; $i -le 5; $i++){
        Write-Host "$i"
    }
}

# Start-ForCyklus

function Start-SwitchStatement{
    switch -Wildcard ('Condition'){
        'Condition' {'Normal match'}
        'Condit*' {'Zero or more wildcard chars.'}
        'C[aoc]ndit[f-l]on' {'Range and set of chars.'}
        'C?ndition' {'Single char. wildcard'}
        'Test*' {'No match'}
    }
}

# Start-SwitchStatement