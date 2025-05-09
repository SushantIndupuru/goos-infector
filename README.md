# The Goos Infector
A simple prank you can play on your friends that uses [Desktop Goose](https://samperson.itch.io/desktop-goose). This harmless prank works by having a script run on the target computer that continually listens for the plugin of a USB drive containing the goose files. The listener script is stored in the user's home folder and is named `listener.exe`. When the USB drive is plugged in, the desktop goose application will be copied over to the user's download folder and will be renamed to `installchrome.exe`, and the date of creation will also be changed. Then, it will run the Desktop Goose application. if there already is Desktop Goose on the system, the script will skip copying and just run the application.  

## Requirements
1. A USB drive
2. A target computer

## Instructions
### Preparing the drive
1. Download the `goos.zip` file found [here](https://github.com/SushantIndupuru/goos-infector/releases/latest/download/goos.zip) or in the [latest release](https://github.com/SushantIndupuru/goos-infector/releases/latest)
2. Extract the zip file into a USB drive. The `listenerinfector.exe` and `goosinfector.exe` files should be in the root of the drive. Your drive is now ready.
### Preparing the computer (To be done on the target computer)
Insert the drive into the computer and run the `listenerinfector.exe` file. The computer is now ready

<br />
Now, a goose should appear whenever you plug in your drive to the target computer.
