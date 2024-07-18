if ! command -v tmux &> /dev/null; then
  gum log --level info "installing tmux..."
  sudo apt install -y tmux > /dev/null
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  gum log --level info "found tmux $(tmux -V | awk '{print $2}')"
fi
