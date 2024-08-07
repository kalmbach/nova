if ! command -v gh &> /dev/null; then
  gum log --level info "instaling gh..."

  sudo curl -fsSLo /usr/share/keyrings/githubcli-archive-keyring.gpg https://cli.github.com/packages/githubcli-archive-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list

  sudo apt update
  sudo apt install -y gh
else
  gum log --level info "found gh $(gh --version | awk '{print $3}')"
fi
