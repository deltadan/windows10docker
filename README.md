# Docker for Windows Dev Environment
This one click deployment will build a Docker on Windows Development box in Azure.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdeltadan%2Fwindows10docker%2Fmaster%2Fazure-deploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

**Software included on the VM**

1. Docker for Windows Community Edition
1. Git for Windows (bash)
1. Visual Studio Code

## Credentials
1. User: Supplied on deploy
1. Password: Supplied on deploy

## IP for NSG
1. Make sure to set your IP Address in the NSG on deploy - default is open to *

**Starting Docker**
1. Once the VM is deployed use the Azure portal to connect.
1. Double click the Docker for Windows shortcut on the desktop.
1. It will take a few minutes for Docker to start the first time.

![alt text](https://github.com/deltadan/windows10docker/blob/master/media/dockerrun.png "Docker is Running on Windows 10 in Azure!")
