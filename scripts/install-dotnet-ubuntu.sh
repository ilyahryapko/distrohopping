#!/bin/bash

for dep in wget dpkg
do
  command -v $dep >/dev/null 2>&1 || { echo -en "\nMissing dependency: $dep. Install: 'sudo apt install $dep' or 'sudo pacman -S $dep'";deps=1;}
done
[[ $deps -ne 1 ]] && echo "Dependencies checked" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -sr)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

apt-get update;
apt-get install -y apt-transport-https
apt-get update

apt-get install -y dotnet-sdk-5.0
apt-get install -y dotnet-sdk-3.1
