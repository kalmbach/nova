if ! command -v python3 &> /dev/null; then
  sudo apt install -y python3
else
  gum log --level info "found python $(python3 -V | awk '{print $2}')"
fi

# catppuccin gnome terminal profiles
gum log --level info "creating catppuccin gnome terminal profiles..."
cd /tmp
wget -q -O catppuccin-gnome-terminal-install.py "https://raw.githubusercontent.com/catppuccin/gnome-terminal/main/install.py"
python3 catppuccin-gnome-terminal-install.py > /dev/null
rm catppuccin-gnome-terminal-install.py
cd -

