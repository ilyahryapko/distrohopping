#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

echo 'Docker installation'
echo 'Uninstall old version'

apt-get remove docker docker-engine docker.io containerd runc

echo 'Installing prerequisites'

apt update && \
apt install \
apt-transport-https \
ca-certificates \
curl \
gnupg \
lsb-release -y

echo 'Adding official GPG key'

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo 'Adding repository'

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo 'Performing installation'

apt update && \
apt install docker-ce docker-ce-cli containerd.io -y

echo 'In order to test run the following command'
echo 'sudo docker run hello-world'

echo 'Post install actions:'
echo 'sudo groupadd docker'
echo 'sudo usermod -aG docker $USER'
echo 'newgrp docker'
echo 'docker run hello-world'

