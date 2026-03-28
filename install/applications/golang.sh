if ! command -v go &> /dev/null; then
  p "installing go..."

  wget -qnv -O /tmp/golang.tar.gz "https://go.dev/dl/go1.26.1.linux-amd64.tar.gz"

  rm -rf ~/.local/go
  tar -C ~/.local -xzf /tmp/golang.tar.gz

  p "adding go/bin to PATH..."
  echo "" >> ~/.bashrc
  echo "# go" >> ~/.bashrc
  echo "export GOBIN=\"\$HOME/.local/go/bin\"" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$GOBIN\"" >> ~/.bashrc

  export GOBIN="$HOME/.local/go/bin"
  export PATH="$PATH:$GOBIN"

  p "installing go-language-server..."
  go install golang.org/x/tools/gopls@latest | log
else
  p "found go $(go version | awk '{print $3}' | sed s/^go//)"
fi
