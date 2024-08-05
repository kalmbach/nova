# enable firewall
source $NOVA_PATH/install/security/firewall.sh

if gum confirm "add clamav antivirus protection?"; then
  source $NOVA_PATH/install/security/clamav.sh
fi
