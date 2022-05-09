# Ubuntu-Setup

## Git SSH Setup

1. `mkdir ~/.ssh`
2. `ssh-keygen -o -t rsa -C "email@example.com"`
3. Copy output of `cat id_rsa.pub`
4. Log into GitHub, navigate to your account settings, and find the link named **SSH and GPG keys**. Click on this link to create a new GitHub SSH key. Provide a unique name, and paste the value of the private GitHub SSH key you copied earlier.

## Clone BCN-WS

`git clone git@github.com:Resolut-Tech/BCN-WS.git`

## Artifactory

`artifactory.properties`
```
username=<enter-your-username>
password=<enter-your-password>
```
