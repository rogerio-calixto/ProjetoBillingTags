#!/bin/bash
sudo apt -y update
sleep 15
sudo apt-get install unzip -y
sleep 5
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sleep 5
sudo unzip -u awscliv2.zip
sleep 5
sudo ./aws/install
rm -f awscliv2.zip
sudo apt install apt-transport-https curl gnupg-agent ca-certificates software-properties-common -y
sudo mkdir website
cd website
aws s3 cp s3://projetobillingtags-bucket/website/ . --recursive

sleep 10
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sleep 10
sudo apt install docker-ce docker-ce-cli containerd.io -y
sleep 25
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker
cd /home/ubuntu
aws s3 sync s3://futura-infraestrutura-${ambiente}/repositorios/monolith/observabilidade .
sleep 5
sudo apt  install docker-compose -y
sleep 15
sudo mkdir log
sudo chmod 777 ./log
sudo docker compose --compatibility up -d