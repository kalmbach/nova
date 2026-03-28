if ! command -v nvim &> /dev/null; then
  p "installing neovim..."

  cd /tmp
  NEOVIM_VERSION="nvim-linux-x86_64"
  NEOVIM_PACKAGE="${NEOVIM_VERSION}.tar.gz"

  wget -qnv -O $NEOVIM_PACKAGE "https://github.com/neovim/neovim/releases/latest/download/${NEOVIM_PACKAGE}"
  tar -xzf $NEOVIM_PACKAGE
  sudo install $NEOVIM_VERSION/bin/nvim /usr/local/bin/nvim
  sudo cp -R $NEOVIM_VERSION/lib /usr/local/
  sudo cp -R $NEOVIM_VERSION/share /usr/local/
  rm -rf $NEOVIM_VERSION $NEOVIM_PACKAGE

  p "installing ~/.config/nvim/init.lua..."
  mkdir -p ~/.config/nvim
  cp $NOVA_PATH/install/applications/nvim/init.lua ~/.config/nvim/init.lua

  p "installing ~/.config/nvim/syntax/coffeescript.vim..."
  mkdir -p ~/.config/nvim/syntax
  cp $NOVA_PATH/install/applications/nvim/coffeescript.vim ~/.config/nvim/syntax/coffeescript.vim
else
  p "found nvim $(nvim -v | awk 'NR==1{print $2}')"
fi
