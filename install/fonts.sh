gum log --level info "installing fonts..."
mkdir -p ~/.local/share/fonts

# Run font installers
for installer in $NOVA_PATH/install/fonts/*.sh; do
  source $installer
done

fc-cache
