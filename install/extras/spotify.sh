if gum confirm "install spotify client?"; then
  if ! command -v spotify &> /dev/null; then
    gum log --level info "installing spotify..."
    curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

    sudo apt update
    sudo apt install -y spotify-client
  else
    gum log --level info "found spotify $(spotify --version | awk '{print $3}')"
  fi
fi
