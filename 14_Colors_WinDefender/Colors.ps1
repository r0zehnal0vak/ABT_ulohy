function Write-ColoredText {
    param(
        [string]$text,
        [string]$foregroundColor,
        [string]$backgroundColor
    )

    $esc = [char]27
    $colorReset = "${esc}[0m"
    $foregroundColorCode = @{ # ANSI
        'Black' = 30
        'DarkRed' = 31
        'DarkGreen' = 32
        'DarkYellow' = 33
        'DarkBlue' = 34
        'DarkMagenta' = 35
        'DarkCyan' = 36
        'Gray' = 37
        'DarkGray' = 90
        'Red' = 91
        'Green' = 92
        'Yellow' = 93
        'Blue' = 94
        'Magenta' = 95
        'Cyan' = 96
        'White' = 97
    }[$foregroundColor]

    $backgroundColorCode = @{
        'Black' = 40
        'DarkRed' = 41
        'DarkGreen' = 42
        'DarkYellow' = 43
        'DarkBlue' = 44
        'DarkMagenta' = 45
        'DarkCyan' = 46
        'Gray'   = 47
        'DarkGray' = 100
        'Red' = 101
        'Green' = 102
        'Yellow' = 103
        'Blue' = 104
        'Magenta' = 105
        'Cyan' = 106
        'White' = 107
    }[$backgroundColor]
    
    $text = "${esc}[${foregroundColorCode}m${esc}[${backgroundColorCode}m$text$colorReset"
    Write-Output $text
}

$colorNames = [Enum]::GetNames([System.ConsoleColor])

foreach ($color in $colorNames) {
    $coloredText = Write-ColoredText -text $color -foregroundColor $color
    $customColoredText = Write-ColoredText -text $color -foregroundColor "White" -backgroundColor $color
    $customColoredTextLimited = $customColoredText.Substring(0, [Math]::Min(20, $customColoredText.Length))
    Write-Output ("{0,-8}`t{1,-24}`t{2,-8}" -f $color, $coloredText, $customColoredText)
}