if ! command -v gh &> /dev/null; then
  p "installing github-cli..."

  sudo curl -fsSLo /usr/share/keyrings/githubcli-archive-keyring.gpg https://cli.github.com/packages/githubcli-archive-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

  sudo apt-get update | log
  sudo apt-get install -y gh | log
else
  p "found gh $(gh --version | awk '{print $3}')"
fi
