#!/bin/bash

echo 'Checking dependencies'

for dep in curl wget jq unzip
do
  command -v $dep >/dev/null 2>&1 || { echo -en "\nMissing dependency: $dep. Install: 'sudo apt install $dep' or 'sudo pacman -S $dep'";deps=1;}
done
[[ $deps -ne 1 ]] && echo "Dependencies checked" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }

github_api="https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"
asset=$(curl -s $github_api 2>&1 | jq '.assets[] | select(.name == "JetBrainsMono.zip") | .browser_download_url' -r)
dir=~/distrohopping-font-install
rm -rf $dir
mkdir -p $dir
cd $dir

echo "Downloading font"
wget -qO font.zip $asset

echo "Unpacking"
unzip -q font.zip

echo "Copying to ~/.fonts directory"
mkdir -p ~/.fonts
mv *Nerd\ Font\ Complete\ Mono.ttf ~/.fonts
rm -rf $dir

echo "Font successfully installed"
