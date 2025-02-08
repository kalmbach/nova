if ! command -v tmux &> /dev/null; then
  gum log --level info "installing tmux..."
  sudo apt-get install -y tmux | log
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  # tmux dotfile
  cp $NOVA_PATH/install/applications/tmux/tmux.conf ~/.tmux.conf -v

  # Start tmux when opening terminal
  echo "" >> ~/.bashrc
  echo "# start tmux" >> ~/.bashrc
  echo "[[ -z \"\$TMUX\" ]] && exec tmux" >> ~/.bashrc

  source ~/.bashrc
else
  gum log --level info "found tmux $(tmux -V | awk '{print $2}')"
fi
