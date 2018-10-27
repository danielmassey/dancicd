#!/bin/bash

sudo apt-mark hold grub*
sudo apt-mark hold kernel*
sudo apt-mark hold linux-image-generic linux-headers-generic
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt -y upgrade
apt-cache policy docker-ce
sudo apt -y install openjdk-8-jdk awscli
sudo apt -y install jenkins=2.89.4 docker-ce docker-compose rng-tools golang-go
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu

#Needed for secretservice  Ubuntu issue https://github.com/docker/compose/issues/6023
cat >gpg2.tmp <<EOF
Key-Type: default
Subkey-Type: default
Name-Real: Daniel Massey
Name-Comment: https://github.com/danielmassey/dancicd
Name-Email: danielmassey@danielmassey.com
Expire-Date: 0
Passphrase: password
EOF

gpg2 --full-generate-key --batch gpg2.tmp
rm gpg2.tmp
pass init `gpg2 --list-secret-keys | grep uid -B 1 | head -n 1`

sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl status docker

sudo ufw allow 8080
sudo ufw status

sleep 20

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "ensure this AWS instance has a role allow S3 access"
