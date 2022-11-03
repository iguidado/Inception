#!/bin/bash

#Too use apt over https

sudo apt-get update

 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#Add docker GPG Key (needed to certificate repository)
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Install Docker engine

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli container.d docker-compose-plugin

#Add user to docker group
sudo usermod -aG docker $(whoami)
sudo chmod 660 /run/docker.sock

#Make volume
