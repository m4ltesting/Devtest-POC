﻿# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download
(New-Object System.Net.WebClient).DownloadFile("ftp://ftp.mphasism4l.cloud/QTP%2012%20-%20HP%20UFT%2012.54.zip", "C:\temp\QTP 12 - HP UFT 12.54.zip")
#Invoke-WebRequest "ftp://ftp.mphasism4l.cloud/QTP%2012%20-%20HP%20UFT%2012.54.zip" -OutFile "C:\temp\QTP 12 - HP UFT 12.54.zip" 

(New-Object System.Net.WebClient).DownloadFile("ftp://ftp.mphasism4l.cloud/qtpsetup.exe", "C:\temp\qtpsetup.exe")
#Invoke-WebRequest "ftp://ftp.mphasism4l.cloud/qtpsetup.exe" -OutFile "C:\temp\qtpsetup.exe" 

#Extracting

$shell = New-Object -ComObject shell.application
$zip = $shell.NameSpace("C:\temp\QTP 12 - HP UFT 12.54.zip")
foreach ($item in $zip.items()) {
  $shell.Namespace("C:\temp").CopyHere($item)
}

# Install
Start-Process "C:\temp\setup.exe"
Start-Process "C:\temp\qtptest.exe" 

