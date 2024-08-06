if ! command -v nvim &> /dev/null; then
  gum log --level info "installing neovim..."

  cd /tmp
  wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
  tar -xzf nvim.tar.gz
  sudo install nvim-linux64/bin/nvim /usr/local/bin/nvim
  sudo cp -R nvim-linux64/lib /usr/local/
  sudo cp -R nvim-linux64/share /usr/local/
  rm -rf nvim-linux64 nvim.tar.gz

  # dotfiles
  mkdir -p ~/.config/nvim
  cp $NOVA_PATH/install/applications/nvim/init.lua ~/.config/nvim/ -v

  mkdir -p ~/.config/nvim/syntax
  cp $NOVA_PATH/install/applications/nvim/coffeescript.vim ~/.config/nvim/syntax/ -v
  cd -
else
  gum log --level info "found nvim $(nvim -v | awk 'NR==1{print $2}')"
fi
