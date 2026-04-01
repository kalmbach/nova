if ! command -v rbenv &> /dev/null; then
  p "installing rbenv..."
  git clone -q https://github.com/rbenv/rbenv.git ~/.rbenv 

  p "modifyng .bashrc to setup rbenv"
  echo "" >> ~/.bashrc
  echo "# rbenv" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$HOME/.rbenv/bin\"" >> ~/.bashrc
  echo "eval \"\$(rbenv init - bash)\"" >> ~/.bashrc

  source ~/.bashrc

  p "installing ruby build plugin..."
  git clone -q https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
else
  p "found rbenv $(rbenv --version | awk '{print $2}')"
fi
