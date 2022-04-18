$fsLogixURL="https://aka.ms/fslogix_download"
$installerFile="fslogix_download.zip"
$installPath=New-Item -Path C:\ -Name fslogix -ItemType Directory -ErrorAction SilentlyContinue
Invoke-WebRequest $fsLogixURL -OutFile $installPath\$installerFile
Expand-Archive $installPath\$installerFile -DestinationPath $installPath
Start-Process -FilePath "C:\FSLogix\x64\Release\FSLogixAppsSetup.exe" -ArgumentList "/install /quiet" -Wait -Passthru