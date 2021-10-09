#!/bin/bash

for dep in wget tar
do
  command -v $dep >/dev/null 2>&1 || { echo -en "\nMissing dependency: $dep. Install: 'sudo apt install $dep' or 'sudo pacman -S $dep'";deps=1;}
done
[[ $deps -ne 1 ]] && echo "Dependencies checked" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

rm ~/telegram-dl
wget https://telegram.org/dl/desktop/linux -O ~/telegram-dl
tar -xvf ~/telegram-dl -C /opt/
rm ~/telegram-dl
