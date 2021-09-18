#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ASSETS_DIR="$(dirname "$SCRIPT_DIR")"/../assets

echo 'Checking dependencies'

for dep in curl wget
do
  command -v $dep >/dev/null 2>&1 || { echo -en "\nMissing dependency: $dep. Install: 'sudo apt install $dep' or 'sudo pacman -S $dep'";deps=1;}
done
[[ $deps -ne 1 ]] && echo "Dependencies checked" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }

echo 'Robo3t installation'
echo 'Downloading Robo3t'

curl -s https://api.github.com/repos/Studio3T/robomongo/releases/latest \
| grep "browser_download_url" \
| grep "linux" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -O robo3t-latest.tar.gz -qi -

echo 'Download ended'
echo 'Unpacking and moving to /opt'

tar -xzf robo3t-latest.tar.gz && \
rm robo3t-latest.tar.gz && \
sudo mv robo3t* /opt/robo3t && \
sudo chmod +x /opt/robo3t/bin/robo3t

echo 'Creating of desktop shortcut'

cp $ASSETS_DIR/robo3t.desktop ~/.local/share/applications && \
sudo cp $ASSETS_DIR/robo3t.png /opt/robo3t/bin

echo 'Symlinking'

sudo ln -s /opt/robo3t/bin/robo3t /usr/local/bin/robo3t

echo 'Done!'
