if ! command -v nova &> /dev/null; then
  p "installing nova-cli..."
  curl -fsSL https://raw.githubusercontent.com/kalmbach/nova-cli/refs/heads/main/install.sh | bash | log
else
  p "found nova-cli"
fi
