gum log --level info "Installing dot files..."

# Run dot file installers
for installer in $NOVA_PATH/install/dotfiles/*.sh; do
  source $installer
done
