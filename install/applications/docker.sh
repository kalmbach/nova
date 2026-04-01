if ! command -v docker &> /dev/null; then
  p "installing docker..."
  sudo apt-get install -y docker-compose-v2 | log
else
  p "found docker $(docker --version | awk '{print $3}')"
fi
