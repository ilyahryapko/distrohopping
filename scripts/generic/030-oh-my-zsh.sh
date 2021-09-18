#!/bin/bash

for dep in curl
do
  command -v $dep >/dev/null 2>&1 || { echo -en "\nMissing dependency: $dep. Install: 'sudo apt install $dep' or 'sudo pacman -S $dep'";deps=1;}
done
[[ $deps -ne 1 ]] && echo "Dependencies checked" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }

echo 'Installing OMZSH'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"