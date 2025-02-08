if ! command -v docker &> /dev/null; then
  gum log --level info "installing docker-compose..."
  sudo apt-get install -y docker-compose-v2 | log
else
  gum log --level info "found docker $(docker --version | awk '{print $3}')"
fi
