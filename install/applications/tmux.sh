if ! command -v tmux &> /dev/null; then
  gum log --level info "Installing tmux..."
  sudo apt install -y tmux > /dev/null
else
  gum log --level info "Found tmux $(tmux -V | awk '{print $2}')"
fi
