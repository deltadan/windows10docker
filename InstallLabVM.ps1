#Enable Containers
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All -NoRestart

#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'docker-for-windows',`
            'postman',`
            'nodejs.install',`
            'visualstudiocode',`
            'git',`
            'visualstudio2017community',`
            'visualstudio2017-workload-azure',`
            'visualstudio2017-workload-manageddesktop',`
            'visualstudio2017-workload-netweb',`
            'dotnetcore-sdk'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Update Visual Studio
$command1 = @'
cmd.exe /C C:\Users\demouser\AppData\Local\Temp\chocolatey\visualstudio2017community\15.2.26430.20170605\vs_community.exe --update --quiet --wait
'@
$command2 = @'
cmd.exe /C C:\Users\demouser\AppData\Local\Temp\chocolatey\visualstudio2017community\15.2.26430.20170605\vs_community.exe --update --quiet --wait --passive --norestart --installPath `
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community"
'@
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression -Command:$command1
Invoke-Expression -Command:$command2

#Install Visual Studio Code Extensions
& 'C:\Program Files\Microsoft VS Code\bin\code.cmd' --install-extension ms-vscode.csharp
& 'C:\Program Files\Microsoft VS Code\bin\code.cmd' --install-extension vsciot-vscode.azure-iot-edge

#Add Demo User to docker group
Add-LocalGroupMember -Member demouser -Group docker-users

#Bring down Desktop Shortcuts
$zipDownload = "https://github.com/solliancenet/LABVM/blob/master/iotforbiz/shortcuts.zip?raw=true"
$downloadedFile = "D:\shortcuts.zip"
$vmFolder = "C:\Users\Public\Desktop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $zipDownload -OutFile $downloadedFile
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::ExtractToDirectory($downloadedFile, $vmFolder)

#Reboot
Restart-Computer