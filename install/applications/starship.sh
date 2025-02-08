if ! command -v starship &> /dev/null; then
  gum log --level info "installing starship..."

  cd /tmp
  wget -nv -O starship.tar.gz "https://github.com/starship/starship/releases/download/v1.19.0/starship-x86_64-unknown-linux-gnu.tar.gz"
  tar -xzf starship.tar.gz
  sudo install starship /usr/local/bin/starship
  rm starship starship.tar.gz

  # add entry to bashrc
  echo "" >> ~/.bashrc
  echo "# starship prompt" >> ~/.bashrc
  echo "eval \"\$(starship init bash)\"" >> ~/.bashrc

  # startship dotfile
  cp $NOVA_PATH/install/applications/starship/starship.toml ~/.config/starship.toml -v
  cd -
else
  gum log --level info "found starship $(starship -V | awk '{print $2}')"
fi
