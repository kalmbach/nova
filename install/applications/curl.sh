if ! command -v curl &> /dev/null; then
  p "installing curl..."
  sudo apt-get install -y curl | log
else
  p "found curl $(curl --version | awk 'NR==1{print $2}')"
fi
