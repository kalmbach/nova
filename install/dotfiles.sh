gum log --level info "installing dot files..."

if ! command -v python3 &> /dev/null; then
  sudo apt install -y python3
else
  gum log --level info "found python $(python3 -V | awk '{print $2}')"
fi

# starship
gum log --level info "copying starship dotfile..."
cp $NOVA_PATH/install/dotfiles/starship.toml ~/.config/starship.toml -v

# tmux
gum log --level info "copying tmux dotfile..."
cp $NOVA_PATH/install/dotfiles/tmux.conf ~/.tmux.conf -v

# nvim
gum log --level info "copying nvim dotfiles..."
mkdir -p ~/.config/nvim
cp $NOVA_PATH/install/dotfiles/nvim-init.lua ~/.config/nvim/init.lua -v

mkdir -p ~/.config/nvim/syntax
cp $NOVA_PATH/install/dotfiles/nvim-syntax-coffeescript.vim ~/.config/nvim/syntax/coffeescript.vim -v
 
# catppuccin gnome terminal profiles
gum log --level info "creating catppuccin gnome terminal profiles..."
cd /tmp
wget -q -O catppuccin-gnome-terminal-install.py "https://raw.githubusercontent.com/catppuccin/gnome-terminal/main/install.py"
python3 catppuccin-gnome-terminal-install.py > /dev/null
rm catppuccin-gnome-terminal-install.py
cd -
