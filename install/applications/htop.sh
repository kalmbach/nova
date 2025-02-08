if ! command -v htop &> /dev/null; then
  gum log --level info "installing htop..."
  sudo apt-get install -y htop | log
else
  gum log --level info "found htop $(htop --version | awk '{print $2}')"
fi
