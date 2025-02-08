if ! command -v go &> /dev/null; then
  gum log --level info "installing go..."

  cd /tmp
  wget -nv -O golang.tar.gz "https://go.dev/dl/go1.22.5.linux-amd64.tar.gz"

  rm -rf ~/.local/go
  tar -C ~/.local -xzf golang.tar.gz

  # add entry to bashrc
  echo "" >> ~/.bashrc
  echo "# go" >> ~/.bashrc
  echo "export GOBIN=\"\$HOME/.local/go/bin\"" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$GOBIN\"" >> ~/.bashrc

  cd -

  export GOBIN="$HOME/.local/go/bin"
  export PATH="$PATH:$GOBIN"

  gum log --level info "installing go-language-server..."
  go install golang.org/x/tools/gopls@latest
else
  gum log --level info "found go $(go version | awk '{print $3}' | sed s/^go//)"
fi
