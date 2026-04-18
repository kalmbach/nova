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

else
  p "found nvim $(nvim -v | awk 'NR==1{print $2}')"
fi

ORIG_INIT_LUA="$NOVA_PATH/install/applications/nvim/init.lua"
DEST_INIT_LUA="$HOME/.config/nvim/init.lua"

p "check $DEST_INIT_LUA..."
if [ -f "$DEST_INIT_LUA" ]; then
  if cmp -s "$DEST_INIT_LUA" "$ORIG_INIT_LUA"; then
    read -p "Update $DEST_INIT_LUA? (y/n): " -n 1 -r yn
    echo

    if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
      p "updating $DEST_INIT_LUA..."
      cp $ORIG_INIT_LUA $DEST_INIT_LUA
    fi
  fi
else
  p "installing $DEST_INIT_LUA..."
  mkdir -p ~/.config/nvim
  cp $ORIG_INIT_LUA  $DEST_INIT_LUA
fi

ORIG_COFFEESCRIPT_VIM="$NOVA_PATH/install/applications/nvim/coffeescript.vim"
DEST_COFFEESCRIPT_VIM="$HOME/.config/nvim/syntax/coffeescript.vim"

p "check $DEST_COFFEESCRIPT_VIM..."
if [ ! -f "$DEST_COFFEESCRIPT_VIM" ]; then
  p "installing $DEST_COFFEESCRIPT_VIM..."
  mkdir -p ~/.config/nvim/syntax
  cp $ORIG_COFFEESCRIPT_VIM $DEST_COFFEESCRIPT_VIM
fi
