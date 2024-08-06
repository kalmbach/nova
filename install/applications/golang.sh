if ! command -v go &> /dev/null; then
  gum log --level info "installing go..."

  cd /tmp
  wget -O golang.tar.gz "https://go.dev/dl/go1.22.5.linux-amd64.tar.gz"

  rm -rf ~/.local/go
  tar -C ~/.local -xzf golang.tar.gz

  # add entry to bashrc
  echo "" >> ~/.bashrc
  echo "# go" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$HOME/.local/go/bin\"" >> ~/.bashrc

  source ~/.bashrc
  cd -
else
  gum log --level info "found go $(go version | awk '{print $3}' | sed s/^go//)"
fi
