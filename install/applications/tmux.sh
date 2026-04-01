if ! command -v tmux &> /dev/null; then
  p "installing tmux..."
  sudo apt-get install -y tmux | log

  p "cloning tmux plugin manager..."
  git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  p "copying ~/.tmux.conf..."
  cp $NOVA_PATH/install/applications/tmux/tmux.conf ~/.tmux.conf

  p "modifying .bashrc to start tmux when opening terminal..."
  echo "" >> ~/.bashrc
  echo "# start tmux" >> ~/.bashrc
  echo "[[ -z \"\$TMUX\" ]] && exec tmux" >> ~/.bashrc

  source ~/.bashrc
else
  p "found tmux $(tmux -V | awk '{print $2}')"
fi
