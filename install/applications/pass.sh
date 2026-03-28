if ! command -v pass &> /dev/null; then
  p "installing pass..."
  sudo apt-get install -y pass | log
else
  p "found pass $(pass version | awk 'NR==4{print $2}')"
fi
