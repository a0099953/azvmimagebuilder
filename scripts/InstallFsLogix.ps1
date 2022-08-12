$fileexists = Test-Path -Path 'c:\windows\tmp\fslogix.txt'
 If ($fileexists ) {
    Exit
}
New-Item -Path "$env:TEMP\FSLogix" -ItemType Directory -ErrorAction SilentlyContinue
Copy-Item -Path "\\saambgfilesharescus01.file.core.windows.net\installs\FSLogix_Apps_2.9.8228.50276.zip" -Destination "$env:TEMP\FSLogix" -Recurse
Expand-Archive "$env:TEMP\FSLogix\FSLogix_Apps_2.9.8228.50276.zip" -DestinationPath "$env:TEMP\FSLogix" -Force
Start-Process -FilePath "$env:TEMP\FSLogix\x64\Release\FSLogixAppsSetup.exe" -ArgumentList "/install /quiet" -Wait -Passthru
New-Item -Path "c:\windows\tmp" -ItemType Directory -ErrorAction SilentlyContinue
New-Item -Path 'c:\windows\tmp\fslogix.txt' -ItemType File -ErrorAction SilentlyContinue
