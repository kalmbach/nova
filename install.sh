#!/bin/bash

set -e
set -o pipefail

trap 'echo "$(tput setaf 1)Nova installation failed!$(tput sgr0)\nYou can retry by running: source $NOVA_PATH/install.sh"' ERR
trap 'echo "Exiting installation."' EXIT

tbld=$(tput bold)
tred=$(tput setaf 1)
tgrn=$(tput setaf 2)
tmgt=$(tput setaf 5)
trst=$(tput sgr0)
p() { echo -e "\e[K${tbld}${tgrn}-> $1${trst}"; }
e() { echo "${tbld}${tred}-> $1${trst}"; }

function press_any_key_to_contine() {
  # -n 1: Read only one character
  # -r: Do not allow backslashes to escape characters
  # -s: Do not echo the input character
  # -p: Display a prompt
  read -n 1 -r -s -p $'Press any key to install, or ctrl+c to abort...\n' key
}

log() {
  # exit if stdin is not connected to a pipe
  [[ -t 0 ]] && { echo "'log' should be used with piped input."}; exit 1; }

  while STDIN= read -r line; do
    printf '\033[2K\r%s' "$line"
  done
}

clear 

# Get script execution base path
NOVA_PATH="$(dirname -- "${BASH_SOURCE[0]}")"

echo "

  ▐▛███▜▌    Nova System
  ▝▜█████▛▘  v2.0 
    ▘▘ ▝▝  

"

p "Nova is for fresh Ubuntu 25.10+ installations only!"
press_any_key_to_contine

p "Installation starting..."

# avoid debconf unable to initialize frontend errors
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

# Check the distribution name and version and abort if incompatible
source $NOVA_PATH/install/check-version.sh

# Install applications
source $NOVA_PATH/install/applications.sh

# Security
source $NOVA_PATH/install/security.sh

# Install fonts
source $NOVA_PATH/install/fonts.sh

# customization
# gnome-extensions disable ubuntu-dock@ubuntu.com
# sudo mv /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com{,.bak}

# install lua-language-server
