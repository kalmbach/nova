if ! command -v git &> /dev/null; then
  p "installing git..."
  sudo apt-get install -y git | log
else
  p "found git $(git version | awk '{print $3}')"
fi
