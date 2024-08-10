if ! command -v go &> /dev/null; then
  gum log --level info "installing go..."

  cd /tmp
  wget -O golang.tar.gz "https://go.dev/dl/go1.22.5.linux-amd64.tar.gz"

  rm -rf ~/.local/go
  tar -C ~/.local -xzf golang.tar.gz

  # add entry to bashrc
  echo "" >> ~/.bashrc
  echo "# go" >> ~/.bashrc
  echo "export GOBIN=\"\$HOME/.local/go/bin\"" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$GOBIN\"" >> ~/.bashrc

  source ~/.bashrc
  cd -

  # try to install go language server
  gum log --level info "installing go-language-server..."
  go install golang.org/x/tools/gopls@latest

  gum log --level info "re-installing gum..."
  sudo apt remove -y gum
  go install github.com/charmbracelet/gum@latest
else
  gum log --level info "found go $(go version | awk '{print $3}' | sed s/^go//)"
fi
