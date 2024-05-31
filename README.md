# Chocolatey Remote Install Script

This repository contains a PowerShell script designed to facilitate the remote installation of essential software using Chocolatey, a powerful package manager for Windows.
By running this script, you can quickly and easily set up a new machine with a curated list of programs, ensuring that you have all the necessary tools at your disposal without having to manually install each one.

This script is included in our debloated windows 10 iso [BorgorOS](https://borgor.cafe/)

[Chocolatey website](https://chocolatey.org/)

[List](https://github.com/iNath15/Borgor-Apps/blob/main/app-list.txt) of currently included apps

For any app suggestions please join our [Discord Server](https://discord.gg/wNmXgEyEeG)

## Features

### Automated Installation:
Install a predefined list of software packages with a single command.

### Customizable:
Easily modify the script to include or exclude specific programs.

### Convenient:
Save time and effort when setting up new machines or refreshing existing ones.

### Prerequisites
Before running the script, ensure that you have the following:

- Windows PowerShell
- Administrative privileges
  
(the batch file should ask to be elevated to administrator on its own)

## Usage
> Curl ( command promt )
```batch
curl -O https://raw.githubusercontent.com/iNath15/Borgor-Apps/main/install.bat
```
> run script (assuming you're in the same directory)
```batch
install.bat
```

### Manual download:
> Clone repository with git
```batch
git clone https://github.com/iNath15/Borgor-Apps.git
```
> Download with Curl
```batch
curl -O https://github.com/iNath15/Borgor-Apps/archive/refs/heads/main.zip
```
