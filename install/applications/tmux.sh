if ! command -v tmux &> /dev/null; then
  p "installing tmux..."
  sudo apt-get install -y tmux | log

  p "cloning tmux plugin manager..."
  git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  p "modifying .bashrc to start tmux when opening terminal..."
  echo "" >> ~/.bashrc
  echo "# start tmux" >> ~/.bashrc
  echo "[[ -z \"\$TMUX\" ]] && exec tmux" >> ~/.bashrc

  source ~/.bashrc
else
  p "found tmux $(tmux -V | awk '{print $2}')"
fi

ORIG_TMUX_CONF="$NOVA_PATH/install/applications/tmux/tmux.conf"
DEST_TMUX_CONF="$HOME/.tmux.conf"

p "check $DEST_TMUX_CONF..."
if [ -f "$DEST_TMUX_CONF" ]; then
  if ! cmp -s "$DEST_TMUX_CONF" "$ORIG_TMUX_CONF"; then
    read -p "Update $DEST_TMUX_CONF? (y/n): " -n 1 -r yn
    echo

    if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
      p "updating $DEST_TMUX_CONF..."
      cp $ORIG_TMUX_CONF $DEST_TMUX_CONF
    fi
  fi
else
  p "installing $DEST_TMUX_CONF..."
  cp $ORIG_TMUX_CONF  $DEST_TMUX_CONF
fi
