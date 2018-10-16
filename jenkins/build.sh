#!/bin/bash

sudo apt-mark hold grub*
sudo apt-mark hold kernel*
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt -y upgrade
apt-cache policy docker-ce
sudo apt -y install openjdk-8-jdk
sudo apt -y install jenkins docker-ce docker-compose
sudo usermod -aG docker jenkins
sudo usermod -aG docker  ubuntu

sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl status docker

sudo ufw allow 8080
sudo ufw status
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
