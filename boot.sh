#!/bin/bash

set -e

# avoid debconf unable to initialize frontend errors
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

echo "updating apt repositories..."
sudo apt-get update | log
sudo apt-get install -y git | log

echo "cloning Nova..."
rm -rf ~/.local/share/nova
git clone -q https://github.com/kalmbach/nova.git ~/.local/share/nova

source ~/.local/share/nova/install.sh

echo "Installation complete."
