#!/bin/bash

set -e
set -o pipefail
trap 'echo "$(tput setaf 1)Nova installation failed!$(tput sgr0)\nYou can retry by running: source $NOVA_PATH/install.sh"' ERR

# Get script execution base path
NOVA_PATH="$(dirname -- "${BASH_SOURCE[0]}")"

# Check the distribution name and version and abort if incompatible
source $NOVA_PATH/install/check-version.sh

# Install applications
source $NOVA_PATH/install/applications.sh

# Install fonts
source $NOVA_PATH/install/fonts.sh

# Security
source $NOVA_PATH/install/security.sh
