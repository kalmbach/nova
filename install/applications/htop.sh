if ! command -v htop &> /dev/null; then
  gum log --level info "installing htop..."
  sudo apt install -y htop > /dev/null
else
  gum log --level info "found htop $(htop --version | awk '{print $2}')"
fi
