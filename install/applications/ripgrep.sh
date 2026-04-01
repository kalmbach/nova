if ! command -v rg &> /dev/null; then
  p "installing ripgrep..."
  sudo apt-get install -y ripgrep | log
else
  p "found ripgrep $(rg --version | awk 'NR==1{print $2}')"
fi
