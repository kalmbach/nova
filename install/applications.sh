# Needed for all installers
gum log --level info "Updating APT Repositories..."
sudo apt update -y &> /dev/null

if ! command -v curl &> /dev/null; then
  gum log --level info "Installing curl..."
  sudo apt install -y curl > /dev/null 
else
  gum log --level info "Found curl $(curl --version | awk 'NR==1{print $2}')"
fi

if ! command -v git &> /dev/null; then
  sudo apt install -y git > /dev/null 
else
  gum log --level info "Found git $(git --version | awk '{print $3}')"
fi

if ! command -v unzip &> /dev/null; then
  sudo apt install -y unzip > /dev/null 
else
  gum log --level info "Found unzip $(unzip -v | awk 'NR==1{print $2}')"
fi

# Run application installers
for installer in $NOVA_PATH/install/applications/*.sh; do
  source $installer
done
