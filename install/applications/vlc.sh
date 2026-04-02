if ! command -v vlc &> /dev/null; then
  p "installing vlc..."
  sudo apt-get install -y vlc | log
else
  p "found vlc $(vlc --version | awk 'NR==1{print $3}')"
fi
