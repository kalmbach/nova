if ! command -v rbenv &> /dev/null; then
  gum log --level info "installing rbenv..."
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv

  echo "" >> ~/.bashrc
  echo "# rbenv" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$HOME/.rbenv/bin\"" >> ~/.bashrc
  echo "eval \"\$(rbenv init - bash)\"" >> ~/.bashrc

  source ~/.bashrc

  # Install ruby build essentials
  gum log --level info "installing build essentials..."
  sudo apt-get install -y autoconf patch build-essential libssl-dev \
    libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev \
    libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev | log

  # Add ruby build command
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
else
  gum log --level info "found rbenv $(rbenv --version | awk '{print $2}')"
fi
