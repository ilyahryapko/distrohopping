# Distrohopping flow

## Basic apps

### CORE

    sudo apt install git curl wget cut tr

### ZSH

#### Zsh itself

    sudo apt install zsh

#### Oh-my-zsh

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#### Themes

##### powerlevel10k

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

Set `ZSH_THEME` to // TODO: make script for that

    ZSH_THEME="powerlevel10k/powerlevel10k"



##### nerd fonts

    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Mononoki.zip
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/UbuntuMono.zip

Unpack and `cp` into `~/.fonts` // TODO: make script for that

#### Plugins

##### zsh-syntax-highlighting

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

##### zsh-autosuggestions

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

Set `~/.zshrc` `plugins` as described // TODO: make script for that

    plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

### DEV

#### .NET

Repo 20.04

    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

Repo 20.10

    wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

Install repo

    sudo dpkg -i packages-microsoft-prod.deb

Prerequisites

    sudo apt-get update; \
    sudo apt-get install -y apt-transport-https && \
    sudo apt-get update

.NET 5

    sudo apt-get install -y dotnet-sdk-5.0

.NET 3.1

    sudo apt-get install -y dotnet-sdk-3.1

#### Node.js

Node 16 repo

    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

Node 14 repo

    curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -

Install

    sudo apt-get install -y nodejs

#### Docker

    throw new NotImplementedException();

#### Robo3T

Download latest linux release

    curl -s https://api.github.com/repos/Studio3T/robomongo/releases/latest \
    | grep "linux" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi -

**TODO**: unpack, set QT scale and move to /opt

#### JetBrains

Toolbox (unfortunately no direct link)

    https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linux
