if ! command -v pass &> /dev/null; then
  gum log --level info "installing pass..."
  sudo apt-get install -y pass | log
else
  gum log --level info "found pass $(pass version | awk 'NR==4{print $2}')"
fi
