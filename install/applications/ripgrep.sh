if ! command -v rg &> /dev/null; then
  gum log --level info "installing ripgrep..."
  sudo apt install -y ripgrep
else
  gum log --level info "found ripgrep $(rg --version | awk 'NR==1{print $2}')"
fi
