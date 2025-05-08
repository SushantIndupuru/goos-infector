@echo off


set TARGET=%userprofile%\listener.exe
set SHORTCUT=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\listener.lnk
set WORKING_DIR=%userprofile%

if exist "%TARGET%" (
   taskkill /f /im "listener.exe"
   TIMEOUT /T 1
   del "%TARGET%"

)

echo f | xcopy /f "listener.exe" "%TARGET%" /E /Y 



:: Create the shortcut using VBScript
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%TEMP%\CreateShortcut.vbs"
echo Set oLink = oWS.CreateShortcut("%SHORTCUT%") >> "%TEMP%\CreateShortcut.vbs"
echo oLink.TargetPath = "%TARGET%" >> "%TEMP%\CreateShortcut.vbs"
echo oLink.WorkingDirectory = "%WORKING_DIR%" >> "%TEMP%\CreateShortcut.vbs"
echo oLink.Save >> "%TEMP%\CreateShortcut.vbs"

:: Run the VBScript to create the shortcut
cscript //nologo "%TEMP%\CreateShortcut.vbs"

:: Clean up the temporary VBScript file
del "%TEMP%\CreateShortcut.vbs"

echo Shortcut created successfully.

START "" "%SHORTCUT%"
