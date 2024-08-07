if ! command -v clamd &> /dev/null; then
  gum log --level info "installing clamav..."
  sudo apt install -y clamav-daemon
  sudo mkdir /quarantine

  sudo systemctl enable clamav-daemon 
  sudo systemctl start clamav-daemon

  # On-Access
  sudo cp $NOVA_PATH/install/security/clamonacc.service /etc/systemd/system/clamonacc.service -v
  sudo chown root.root /etc/systemd/system/clamonacc.service

  echo "# ClamAV: Fix inotify watchpoint limitations" | sudo tee -a  "/etc/sysctl.conf"
  echo "fs.inotify.max_user_watches = 524288" | sudo tee -a "/etc/sysctl.conf"

  echo "OnAccessExcludeUname clamav" | sudo tee -a "/etc/clamav/clamd.conf"
  echo "OnAccessExcludeRootUID true" | sudo tee -a "/etc/clamav/clamd.conf"
  echo "OnAccessIncludePath /home" | sudo tee -a "/etc/clamav/clamd.conf"

  sudo systemctl enable clamonacc
  sudo systemctl start clamonacc
else
  gum log level info "found clamav $(clamd --version | awk '{print $2}' | awk '{split($0,a,\"/\"); print a[1]}')"
fi
