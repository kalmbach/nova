if ! command -v python3 &> /dev/null; then
  sudo apt-get install -y python3 | log
else
  gum log --level info "found python $(python3 -V | awk '{print $2}')"
fi

# catppuccin gnome terminal profiles
if gum confirm "create catppuccin gnome terminal profiles?"; then
  gum log --level info "creating catppuccin gnome terminal profiles..."
  cd /tmp
  wget -nv -O catppuccin-gnome-terminal-install.py "https://raw.githubusercontent.com/catppuccin/gnome-terminal/main/install.py"
  python3 catppuccin-gnome-terminal-install.py | log
  rm catppuccin-gnome-terminal-install.py
  cd -
fi
