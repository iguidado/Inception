#!/bin/bash

LOGIN=iguidado

#Too use apt over https

sudo apt-get update

sudo apt-get install -y \
   ca-certificates \
   curl \
   gnupg \
   lsb-release

#Add docker GPG Key (needed to certificate repository)
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Add docker repo to repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Install Docker engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

#Add user to docker group
sudo usermod -aG docker $(logname)
sudo chmod 660 /run/docker.sock

#Make volume
##Wordpress
mkdir -p /home/$(logname)/data/
wget https://fr.wordpress.org/latest-fr_FR.tar.gz -O - | zcat | tar x -C /home/$(logname)/data/

##Databases

#Domain name
echo "127.0.1.1 $(logname).42.fr" >> /etc/hosts
