#!/bin/bash

set -e

sudo apt update

# Install Git
printf "\n\nInstall Git...START"
sudo apt install build-essential unzip curl git git-lfs -y
printf "\n\nInstall Git...COMPLETE"

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

# Install SDKMan, Java 11 manually
# https://sdkman.io/install
# sdk list java
# sdk java install 11.0.15-tem

# Install docker-ce and docker compose manually
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04
