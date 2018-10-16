#!/bin/bash

sudo apt-mark hold grub*
sudo apt-mark hold kernel*
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt -y upgrade
sudo apt -y install openjdk-8-jdk
sudo apt -y install jenkins

sudo systemctl start jenkins
sudo systemctl status jenkins

sudo ufw allow 8080
sudo ufw status
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
