#!/bin/bash

echo 'Checking dependencies'

for dep in git zsh
do
  command -v $dep >/dev/null 2>&1 || { echo -en "\nMissing dependency: $dep. Install: 'sudo apt install $dep' or 'sudo pacman -S $dep'";deps=1;}
done
[[ $deps -ne 1 ]] && echo "Dependencies checked" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }

echo 'Installing Powerlevel10 theme'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo 'Setting the theme'
sed -i 's/ZSH_THEME=\".*\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/' ~/.zshrc

echo 'Installing plugins'

echo 'Installing zsh-syntax-highlighting'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo 'Installing zsh-autosuggestions'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo 'Setting the plugins'
sed -i 's/plugins=(.*)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc