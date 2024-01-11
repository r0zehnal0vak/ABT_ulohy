$interval = 5
$Directory = [System.IO.Path]::Combine($env:USERPROFILE, "Obrázky")

while ($true) {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    
    $screenBounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bitmap = New-Object Drawing.Bitmap $screenBounds.Width, $screenBounds.Height
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen($screenBounds.Location, [Drawing.Point]::Empty, $screenBounds.Size)
    
    $filename = "Screenshot_$timestamp.png"
    $filepath = Join-Path -Path $Directory -ChildPath $filename

    $bitmap.Save($filepath, [Drawing.Imaging.ImageFormat]::Png)
    
    Write-Host "Screenshot captured and saved to $filepath"

    Start-Sleep -Seconds $interval
}
