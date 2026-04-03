# add ~/.local/bin to the PATH
if [[ ! ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
  p "adding ~/.local/bin to the PATH..."
  mkdir -p ~/.local/bin

  echo "" >> ~/.bashrc
  echo "# .local/bin" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.bashrc

  source ~/.bashrc
fi

# basic
source $NOVA_PATH/install/applications/build-essential.sh
source $NOVA_PATH/install/applications/curl.sh
source $NOVA_PATH/install/applications/wget.sh
source $NOVA_PATH/install/applications/unzip.sh
source $NOVA_PATH/install/applications/git.sh
source $NOVA_PATH/install/applications/ripgrep.sh
source $NOVA_PATH/install/applications/fzf.sh
source $NOVA_PATH/install/applications/gnupg2.sh
source $NOVA_PATH/install/applications/htop.sh
source $NOVA_PATH/install/applications/pass.sh
source $NOVA_PATH/install/applications/docker.sh
source $NOVA_PATH/install/applications/github.sh
source $NOVA_PATH/install/applications/github-dash.sh

# dev 
source $NOVA_PATH/install/applications/fnm.sh
source $NOVA_PATH/install/applications/rbenv.sh
source $NOVA_PATH/install/applications/lua-language-server.sh
source $NOVA_PATH/install/applications/golang.sh
source $NOVA_PATH/install/applications/gopls.sh
source $NOVA_PATH/install/applications/glow.sh

# the editor
source $NOVA_PATH/install/applications/neovim.sh

# term
source $NOVA_PATH/install/applications/starship.sh
source $NOVA_PATH/install/applications/tmux.sh

# extras
source $NOVA_PATH/install/applications/spotify.sh
source $NOVA_PATH/install/applications/vlc.sh
