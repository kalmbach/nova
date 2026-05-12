if ! command -v vlc &> /dev/null; then
  p "installing vlc..."
  sudo apt-get install -y vlc | log
else
  p "found vlc $(vlc --version 2>/dev/null | awk 'NR==1{print $3}')"
fi
