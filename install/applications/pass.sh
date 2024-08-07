if ! command -v pass &> /dev/null; then
  gum log --level info "installing pass..."
  sudo apt install -y pass
else
  gum log --level info "found pass $(pass version | awk 'NR==4{print $2}')"
fi
