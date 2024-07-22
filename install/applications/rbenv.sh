if ! command -v rbenv &> /dev/null; then
  gum log --level info "installing rbenv..."
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv

  echo "" >> ~/.bashrc
  echo "# rbenv" >> ~/.bashrc
  echo "export PATH=\"\$HOME/.rbenv/bin:\$PATH\"" >> ~/.bashrc
  echo "\$(rbenv init - bash)" >> ~/.bashrc

  # Install ruby build essentials
  sudo apt install -y autoconf patch build-essential libssl-dev \
    libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev \
    libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

  # Add ruby build command
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
else
  gum log --level info "found rbenv $(rbenv --version | awk '{print $2}')"
fi
