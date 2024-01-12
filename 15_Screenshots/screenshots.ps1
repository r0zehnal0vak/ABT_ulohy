$interval = 5
$Directory = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('MyPictures'), "Screenshots")

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

while ($true) {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen
    $bitmap = New-Object Drawing.Bitmap $screen.Bounds.Width, $screen.Bounds.Height
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen($screen.Bounds.Location, [Drawing.Point]::Empty, $screen.Bounds.Size)
    
    $filename = "Screenshot_$timestamp.png"
    $filepath = Join-Path -Path $Directory -ChildPath $filename

    $bitmap.Save($filepath, [Drawing.Imaging.ImageFormat]::Png)
    
    Write-Host "Screenshot captured and saved to $filepath"

    Start-Sleep -Seconds $interval
}
