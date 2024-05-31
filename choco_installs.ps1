param($cpu, $gpu)

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

if ($cpu -eq "amd") {
    choco install amd-ryzen-chipset
} elseif ($cpu -eq "intel") {
    Write-Output "There doesn't seem to be any drivers for intel on chocolatey"
    Write-Output "Download the drivers here: https://www.intel.com/content/www/us/en/download-center/home.html"
    $continue = Read-Host -Prompt "Continue? [y/n]"
    if ($continue -eq 'n') {
        Exit
}

} 

if ($gpu -eq "amd") {
    Write-Output "There doesn't seem to be any drivers for amd on chocolatey"
    Write-Output "Download the drivers here: https://www.amd.com/en/support/download/drivers.html"
    $continue = Read-Host -Prompt "Continue? [y/n]"
    if ($continue -eq 'n') {
        Exit
    }

} elseif ($gpu -eq "nvidia") {
    choco install nvidia-display-driver
} elseif ($gpu -eq "intel") {
    choco install intel-arc-graphics-driver
}

choco install firefox -y
choco install brave -y
choco install discord -y
choco install spotify -y
choco install winfetch -y
choco install prismlauncher -y
choco install openjdk8jre -y
choco install oracle17jdk -y
choco install vscode -y
choco install steam -y
choco install simplewall -y
choco install wiztree -y
choco install vlc -y
choco install audacity --version 2.4.2 -y
choco install obs-studio -y
choco install github-desktop -y
choco install blender -y
choco install nomacs -y
choco install youtube-dl-gui -y
choco install crystaldiskinfo -y
choco install crystaldiskmark -y
choco install mpc-hc -y
choco install 7zip -y
choco install git -y
choco install python --version 3.12.3 -y
