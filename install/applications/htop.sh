if ! command -v htop &> /dev/null; then
  p "installing htop..."
  sudo apt-get install -y htop | log
else
  p "found htop $(htop --version | awk '{print $2}')"
fi
