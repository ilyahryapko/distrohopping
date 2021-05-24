#!/bin/bash

for dep in wget dpkg
do
  command -v $dep >/dev/null 2>&1 || { echo -en "\nMissing dependency: $dep. Install: 'sudo apt install $dep' or 'sudo pacman -S $dep'";deps=1;}
done
[[ $deps -ne 1 ]] && echo "Dependencies checked" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update;
sudo apt-get install -y apt-transport-https
sudo apt-get update

sudo apt-get install -y dotnet-sdk-5.0
sudo apt-get install -y dotnet-sdk-3.1