# Distrohopping flow

## Basic apps

### CORE

    sudo apt install git curl wget cut tr

### Appearance

#### Papirus icons

    wget -qO- https://git.io/papirus-icon-theme-install | sh

### ZSH

#### Zsh itself

    sudo apt install zsh

#### [Oh-my-zsh](https://ohmyz.sh/)

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#### Themes

##### [powerlevel10k](https://github.com/romkatv/powerlevel10k)


    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

Set `ZSH_THEME` to // TODO: make script for that

    ZSH_THEME="powerlevel10k/powerlevel10k"

##### [Nerd fonts](https://www.nerdfonts.com/)

    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Mononoki.zip
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/UbuntuMono.zip

Unpack and `cp` into `~/.fonts` // TODO: make script for that

#### Plugins

##### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

##### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

Set `~/.zshrc` `plugins` as described // TODO: make script for that

    plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

### DEV

#### [.NET](https://docs.microsoft.com/ru-ru/dotnet/core/install/linux)
Use one of repos
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

#### [Node.js](https://nodejs.org/en/): [via package manager](https://github.com/nodesource/distributions)

Use one of the following repos
Node 16 repo

    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

Node 14 repo

    curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -

Install

    sudo apt-get install -y nodejs

#### [Docker](https://docs.docker.com/engine/install/ubuntu/)
Prerequisites

    sudo apt-get update && \
    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

Add Docker’s official GPG key

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

Add repository

    echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

Actual install

    sudo apt update && \
    sudo apt install docker-ce docker-ce-cli containerd.io

Test

    sudo docker run hello-world

Post-install

    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    docker run hello-world

#### [Docker Compose](https://docs.docker.com/compose/install/)
Download latest

    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

Add execution permission

    sudo chmod +x /usr/local/bin/docker-compose
#### [Robo3T](https://github.com/Studio3T/robomongo)
**TLDR** (inside repo directory):

    ./scripts/install-robo3t.sh

Or manual
Download latest linux release

    curl -s https://api.github.com/repos/Studio3T/robomongo/releases/latest \
    | grep "linux" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi -

Unpack

    tar -xzvf robo3t*.tar.gz && \
    rm robo3t*tar* && \
    sudo mv robo3t* /opt/robo3t && \
    sudo chmod +x /opt/robo3t/bin/robo3t

Create desktop shortcut

    cp ./assets/robo3t.desktop ~/.local/share/applications && \
    sudo cp ./assets/robo3t.png /opt/robo3t/bin

#### [JetBrains Toolbox](https://www.jetbrains.com/ru-ru/toolbox-app/)

Toolbox (unfortunately no direct link)

    https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linux

#### [VSCode](https://code.visualstudio.com/docs/)

    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    sudo apt install apt-transport-https
    sudo apt update
    sudo apt install code
