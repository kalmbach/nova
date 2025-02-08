if ! command -v rg &> /dev/null; then
  gum log --level info "installing ripgrep..."
  sudo apt-get install -y ripgrep | log
else
  gum log --level info "found ripgrep $(rg --version | awk 'NR==1{print $2}')"
fi
