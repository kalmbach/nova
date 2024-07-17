gum log --level info "Installing dot files..."

if ! command -v python3 &> /dev/null; then
  sudo apt install -y python3
else
  gum log --level info "Found python $(python3 -V | awk '{print $2}')"
fi

# Starship
cp $NOVA_PATH/install/dotfiles/starship.toml ~/.config/starship.toml -v
echo "" >> ~/.bashrc
echo "# starship prompt" >> ~/.bashrc
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc

# Tmux
cp $NOVA_PATH/install/dotfiles/.tmux.conf ~/.tmux.conf -v

# Catppuccin Gnome Terminal Profiles
cd /tmp
wget -q -O catppuccin-gnome-terminal-install.py "https://raw.githubusercontent.com/catppuccin/gnome-terminal/main/install.py"
python3 catppuccin-gnome-terminal-install.py
rm catppuccin-gnome-terminal-install.py
cd -
