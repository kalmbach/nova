if ! command -v nvim &> /dev/null; then
  gum log --level info "Installing neovim..."
  cd /tmp
  wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
  tar -xf nvim.tar.gz
  sudo install nvim-linux64/bin/nvim /usr/local/bin/nvim
  sudo cp -R nvim-linux64/lib /usr/local/
  sudo cp -R nvim-linux64/share /usr/local/
  rm -rf nvim-linux64 nvim.tar.gz
  cd -
else
  gum log --level info "Found nvim $(nvim -v | awk 'NR==1{print $2}')"
fi
