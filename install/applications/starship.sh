if ! command -v starship &> /dev/null; then
  p "installing starship..."

  sudo curl -sS https://starship.rs/install.sh | sh -s -- -y -b ~/.local/bin | log

  p "modifying .bashrc to add starship prompt..."
  echo "" >> ~/.bashrc
  echo "# starship prompt" >> ~/.bashrc
  echo "eval \"\$(starship init bash)\"" >> ~/.bashrc

  p "installing ~/.config/starship.toml..."
  cp $NOVA_PATH/install/applications/starship/starship.toml ~/.config/starship.toml

  source ~/.bashrc
else
  p "found starship $(starship -V | awk '{print $2}')"
fi
