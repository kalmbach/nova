if ! command -v tmux &> /dev/null; then
  gum log --level info "installing tmux..."
  sudo apt install -y tmux > /dev/null
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  # tmux dotfile
  cp $NOVA_PATH/install/dotfiles/tmux.conf ~/.tmux.conf -v

  # tmux git_branch plugin
  cp $NOVA_PATH/install/dotfiles/tmux-git-branch-plugin.sh \
    ~/.tmux/plugins/tmux/custom/git_bransh.sh -v

  # Start tmux when opening terminal
  echo "" >> ~/.bashrc
  echo "# start tmux" >> ~/.bashrc
  echo "[[ -z \"\$TMUX\" ]] && exec tmux" >> ~/.bashrc
else
  gum log --level info "found tmux $(tmux -V | awk '{print $2}')"
fi
