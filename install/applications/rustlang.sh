if ! command -v rustc &>/dev/null; then
  gum log --level info "installing rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

  # add entry to bashrc
  echo "" >> ~/.bashrc
  echo "# rust" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$HOME/.cargo/bin\"" >> ~/.bashrc

  gum log --level info "installing rust-analyzer..."
  export PATH="$PATH:$HOME/.cargo/bin"
  rustup component add rust-analyzer
else
  gum log --level info "found rust $(rustc --version | awk '{print $2}')"
fi
