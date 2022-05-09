# Ubuntu-Setup

## Git SSH Setup

1. `mkdir ~/.ssh`
2. `cd ~/.ssh`
3. `ssh-keygen -o -t rsa -C "email@example.com"`
4. Copy output of `cat id_rsa.pub`
5. Log into GitHub, navigate to your account settings, and find the link named **SSH and GPG keys**. Click on this link to create a new GitHub SSH key. Provide a unique name, and paste the value of the private GitHub SSH key you copied earlier.

## Install Java

[SDKMan](https://sdkman.io/) will be used to install Java.

1. `curl -s "https://get.sdkman.io" | bash`
2. `source "$HOME/.sdkman/bin/sdkman-init.sh"`
3. `sdk install java 11.0.15-tem`
4. `source ~/.bashrc`
5. `java --version`

## Install Docker

1. Install docker-ce by executing the following, one line at-a-time
```
sudo apt install apt-transport-https ca-certificates software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce -y
```
2. Ensure docker is running : `sudo systemctl status docker`
3. Add user to `docker` group to run docker commands as non-sudo
   `sudo usermod -aG docker ${USER}`
4. Install docker-compose
   `sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
5. Grant the binary executable rights : `sudo chmod +x /usr/local/bin/docker-compose`
6. Ensure docker-compose is working : `docker-compose --version`


## Clone BCN-WS

`git clone git@github.com:Resolut-Tech/BCN-WS.git`

## Artifactory

Create a file named `artifactory.properties` in the project root-directory with the following content:
```
username=<enter-your-username>
password=<enter-your-password>
```
