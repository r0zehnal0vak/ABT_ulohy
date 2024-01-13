$ansiForegroundColorCodes = @(30..37) + @(90..97)
$ansiBackgroundColorCodes = @(40..47) + @(100..107)
$ansiColorNames = @("Black", "DarkRed", "DarkGreen", "DarkYellow", "DarkBlue", "DarkMagenta", "DarkCyan", "Gray", "DarkGray", "Red", "Green", "Yellow", "Blue", "Magenta", "Cyan", "White")
$esc = [char]27
$colorReset = "${esc}[0m"

foreach ($index in 0..($ansiColorNames.Count - 1)) {
    $foregroundColorCode = $ansiForegroundColorCodes[$index]
    $backgroundColorCode = $ansiBackgroundColorCodes[$index]
    $colorName = $ansiColorNames[$index]
    
    $whiteText = "${esc}[0m$colorName$colorReset"
    $coloredText = "${esc}[${foregroundColorCode}m$colorName$colorReset" 
    $coloredBackgroud = "${esc}[${backgroundColorCode}m$colorName      $colorReset"

    $outputLine = "{0,-24}{1,-30}{2,-8}" -f $whiteText, $coloredText, $coloredBackgroud
    Write-Output $outputLine
}



