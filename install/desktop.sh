# Run desktop installers
for installer in $NOVA_PATH/install/desktop/*.sh; do
  source $installer
done

# Logout to pickup changes
#gum confirm "Ready to logout for all settings to take effect?" \
#  && gnome-session-quit --logout --no-prompt
