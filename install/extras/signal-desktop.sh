if gum confirm "install signal desktop?"; then
  if ! command -v signal-desktop &> /dev/null; then
    gum log --level info "installing signal-desktop..."

    # Get signal public key
    cd /tmp
    wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
    cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg
    rm signal-desktop-keyring.gpg
    cd -

    # add repo
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
    sudo tee /etc/apt/sources.list.d/signal-xenial.list

    sudo apt update
    sudo apt install -y signal-desktop
  else
    gum log --level info "found signal-desktop"
  fi
fi
