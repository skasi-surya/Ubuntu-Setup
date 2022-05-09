#!/bin/bash

set -e

sudo apt update

# Install Git
printf "\n\nInstall Git...START"
sudo apt install build-essential unzip curl git git-lfs -y
printf "\n\nInstall Git...COMPLETE"

# Install Java 11
printf "\n\nInstall Java...START"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 11.0.15-tem
source ~/.bashrc
# Check Java installation
checkJava="java --version"
if eval $checkJava | grep -q '11.0.15'; then
    printf "\n\nInstall Java...COMPLETE"
else
    printf "\n\nInstall Java...FAILED"
fi

# Install Docker
printf "\n\nInstall Docker...START"
sudo apt install apt-transport-https ca-certificates software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce -y
# check if service is running - sudo systemctl status docker
checkDocker="sudo systemctl status docker"
if eval $checkDocker | grep -q 'active'; then
    sudo usermod -aG docker ${USER}
    printf "\n\nInstall Docker...COMPLETE"
else
    printf "\n\nInstall Docker...FAILED"
fi

printf "\n\nInstall docker-compose...START"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
checkDockerCompose="docker-compose --version"
sudo chmod +x /usr/local/bin/docker-compose
if eval $checkDockerCompose | grep -q '1.29.2'; then
    printf "\n\nInstall Docker-Compose...COMPLETE"
else
    printf "\n\nInstall Docker-Compose...FAILED"
fi

printf "\n\nInstall Postman...START"
sudo snap install postman
printf "\n\nInstall Postman...COMPLETE"

printf "\n\nInstall DBeaver...START"
sudo snap install dbeaver-ce
printf "\n\nInstall DBeaver...COMPLETE"

printf "\n\nInstall VS Code...START"
sudo snap install --classic code
printf "\n\nInstall VS Code...COMPLETE"

# Install AWS CLI
printf "\n\nInstall AWS-CLI...START"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
checkAwsCli="aws --version"
if eval $checkAwsCli | grep -q '2.6.2'; then
    printf "\n\nInstall AWS-CLI...COMPLETE"
else
    printf "\n\nInstall AWS-CLI...FAILED"
fi

printf "\n\nDONE!!"

printf "\n\nPlease enter password to simulate logout:"

su - ${USER}
