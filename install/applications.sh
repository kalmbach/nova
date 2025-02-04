# Needed for all installers
gum log --level info "updating apt repositories..."
sudo apt update | log

gum log --level info "installing updates..."
sudo apt upgrade -y | log

if ! command -v curl &> /dev/null; then
  gum log --level info "installing curl..."
  sudo apt install -y curl | log
else
  gum log --level info "found curl $(curl --version | awk 'NR==1{print $2}')"
fi

if ! command -v git &> /dev/null; then
  sudo apt install -y git | log
else
  gum log --level info "found git $(git --version | awk '{print $3}')"
fi

if ! command -v unzip &> /dev/null; then
  sudo apt install -y unzip | log
else
  gum log --level info "found unzip $(unzip -v | awk 'NR==1{print $2}')"
fi

# add ~/.local/bin to the PATH
if [[ ! ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
  echo "" >> ~/.bashrc
  echo "# .local/bin" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.bashrc

  source ~/.bashrc
fi

# Run application installers
for installer in $NOVA_PATH/install/applications/*.sh; do
  source $installer
done
