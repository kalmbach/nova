if ! command -v docker &> /dev/null; then
  gum log --level info "installing docker..."
  sudo apt install -y docker-compose-v2
else
  gum log --level info "found docker $(docker --version | awk '{print $3}')"
fi
