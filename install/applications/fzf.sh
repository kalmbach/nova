if ! command -v fzf &> /dev/null; then
  p "installing fzf..."
  sudo apt-get install -y fzf | log
else
  p "found fzf $(fzf --version | awk '{print $1}')"
fi
