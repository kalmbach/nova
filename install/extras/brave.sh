if gum confirm "install brave browser?"; then
  if ! command -v brave-browser &> /dev/null; then
    gum log --level info "installing brave browser..."
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt update > /dev/null
    sudo apt install -y brave-browser > /dev/null
  else
    gum log --level info "found brave browser $(brave-browser --version | awk '{print $3}')"
  fi
fi
