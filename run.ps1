**# 1. កំណត់ Link ទៅកាន់ File EXE របស់អ្នក (Copy ចេញពី GitHub Release)**

**$url = "https://github.com/ismerak/kdl2k26/releases/download/kdlv1.0/kdl26.exe"**

**$path = "$env:TEMP\\kdl26.exe"**



**# 2. បង្ហាញសារទៅកាន់អ្នកប្រើ (ស្អាតដូច KMS)**

**Write-Host "==========================================" -ForegroundColor Cyan**

**Write-Host "      KDL VIDEO DOWNLOADER INSTALLER      " -ForegroundColor White -BackgroundColor Blue**

**Write-Host "==========================================" -ForegroundColor Cyan**

**Write-Host "\[+] Connecting to GitHub..." -ForegroundColor Yellow**



**# 3. ទាញយក File (ថែម -UseBasicParsing ដើម្បីការពារ Error លើ Windows ចាស់ៗ)**

**try {**

&#x20;   **Invoke-WebRequest -Uri $url -OutFile $path -UseBasicParsing**

&#x20;   **Write-Host "\[+] Download Complete!" -ForegroundColor Green**

**} catch {**

&#x20;   **Write-Host "\[!] Error: មិនអាចទាញយកបានទេ សូមពិនិត្យអ៊ីនធើណេត!" -ForegroundColor Red**

&#x20;   **exit**

**}**



**# 4. បើកដំណើរការកម្មវិធី**

**Write-Host "\[+] Launching Tool..." -ForegroundColor Magentax**

**\& $path**

