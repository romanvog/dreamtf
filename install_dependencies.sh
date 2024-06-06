#!/bin/bash
sudo apt-get update
sudo apt-get install -y docker.io
sudo apt  install docker-compose -y
sudo systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
git clone https://github.com/romanvog/dream.git /home/ubuntu/dream
sudo docker-compose -f /home/ubuntu/dream/compose.yaml up