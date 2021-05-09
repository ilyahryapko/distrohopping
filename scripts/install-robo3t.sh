#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ASSETS_DIR="$(dirname "$SCRIPT_DIR")"/assets

echo 'Installing prerequisites'

sudo apt-get install curl wget -qq > /dev/null

echo 'Robo3t installation'
echo 'Downloading Robo3t'

curl -s https://api.github.com/repos/Studio3T/robomongo/releases/latest \
| grep "browser_download_url" \
| grep "linux" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

echo 'Download ended'
echo 'Unpacking and moving to /opt'

tar -xzf robo3t*.tar.gz && \
rm robo3t*tar* && \
sudo mv robo3t* /opt/robo3t && \
sudo chmod +x /opt/robo3t/bin/robo3t

echo 'Creating of desktop shortcut'

cp $ASSETS_DIR/robo3t.desktop ~/.local/share/applications && \
sudo cp $ASSETS_DIR/robo3t.png /opt/robo3t/bin

echo 'Done!'
