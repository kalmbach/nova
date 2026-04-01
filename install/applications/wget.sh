if ! command -v wget &> /dev/null; then
  p "installing wget..."
  sudo apt-get install -y wget | log
else
  p "found wget $(wget --version | awk 'NR==1{print $3}')"
fi
