#!/bin/bash

if [ ! -f /etc/os-release ]; then
  e "Error: Unable to determine OS. /etc/os-release file not found."
  e "Installation stopped."
  exit 1
fi

. /etc/os-release

# Check if running on Ubuntu 25.10 or higher
if [ "$ID" != "ubuntu" ] || [ $(echo "$VERSION_ID >= 25.10" | bc) != 1 ]; then
  e "Error: OS requirement not met"
  e "You are currently running: $ID $VERSION_ID"
  e "OS required: Ubuntu 25.10 or higher"
  e "Installation stopped."
  exit 1
fi

# Check if running on x86
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "i686" ]; then
  e "Error: Unsupported architecture detected"
  e "Current architecture: $ARCH"
  e "This installation is only supported on x86 architectures (x86_64 or i686)."
  e "Installation stopped."
  exit 1
fi

p "Detected ${tmgt}$ID $VERSION_ID${trst} running on ${tmgt}$ARCH${trst}."
