#!/bin/bash

echo 'Docker installation'
echo 'Uninstall old version'

sudo apt-get remove docker docker-engine docker.io containerd runc

echo 'Installing prerequisites'

sudo apt-get update && \
sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg \
lsb-release

echo 'Adding official GPG key'

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo 'Adding repository'

echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo 'Performing installation'

sudo apt-get update && \
    sudo apt-get install docker-ce docker-ce-cli containerd.io

echo 'In order to test run the following command'
echo 'sudo docker run hello-world'

echo 'Post install actions:'
echo '1) sudo groupadd docker'
echo '2) sudo usermod -aG docker $USER'
echo '3) newgrp docker'
echo '4) docker run hello-world'

