@echo off
dir
if exist "%userprofile%\Downloads\ChromeSetup.exe\" (
  "%userprofile%\Downloads\ChromeSetup.exe\DesktopGoose v0.31\GooseDesktop.exe"
   exit /b 1
) else (
  echo "n"
)
xcopy "goos.zip" "%userprofile%\Downloads\" /E  /Y


Call :UnZipFile "%userprofile%\Downloads\" "%userprofile%\Downloads\goos.zip"

del "%userprofile%\Downloads\goos.zip"

RENAME "%userprofile%\Downloads\Desktop Goose v0.31" "ChromeSetup.exe"



REM Set the target folder and icon path
set "FOLDER=%userprofile%\Downloads\ChromeSetup.exe"
set "ICON=MyLogo1.ico"

REM Create the folder if it doesn't exist
if not exist "%FOLDER%" mkdir "%FOLDER%"

REM Copy the icon into the folder as foldericon.ico
copy "%ICON%" "%FOLDER%\foldericon.ico" >nul

REM Create desktop.ini with icon info
(
    echo [.ShellClassInfo]
    echo IconResource=foldericon.ico,0
    echo IconFile=foldericon.ico
    echo IconIndex=0
) > "%FOLDER%\desktop.ini"

REM Set attributes: read-only and system on the folder
attrib +s +r "%FOLDER%"

REM Hide desktop.ini and the icon file
attrib +h "%FOLDER%\desktop.ini"
attrib +h "%FOLDER%\foldericon.ico"

echo Custom icon applied to "%FOLDER%"




nircmd.exe setfilefoldertime "%userprofile%\Downloads\ChromeSetup.exe" "11-10-2024 08:14:00" "11-10-2024 08:14:00"

"%userprofile%\Downloads\ChromeSetup.exe\DesktopGoose v0.31\GooseDesktop.exe"
exit /b 1




:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%