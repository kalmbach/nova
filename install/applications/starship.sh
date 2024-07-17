if ! command -v starship &> /dev/null; then
  gum log --level info "Installing starship..."
  cd /tmp
  wget -0 starship.tar.gz "https://github.com/starship/starship/releases/download/v1.19.0/starship-x86_64-unknown-linux-gnu.tar.gz"
  tar -xf starship.tar.gz
  sudo install starship /usr/local/bin/starship 
  rm starship starship.tar.gz
  cd -
else
  gum log --level info "Found starship $(starship -V | awk '{print $2}')"
fi
