if ! command -v clamd &> /dev/null; then
  gum log --level info "installing clamav..."
  sudo apt install -y clamav-daemon > /dev/null
  sudo mkdir /quarantine

  sudo systemctl enable clamav-daemon 
  sudo systemctl start clamav-daemon

  sudo echo "# ClamAV: Fix inotify watchpoint limitations" >> /etc/sysctl.conf
  sudo echo "fs.inotify.max_user_watches = 524288" >> /etc/sysctl.conf

  sudo cp $NOVA_PATH/install/security/clamonacc.service /etc/systemd/system/clamonacc.service -v
  sudo chown root.root /etc/systemd/system/clamonacc.service

  sudo systemctl enable clamonacc
  sudo systemctl start clamonacc
else
  gum log level info "found clamav $(clamd --version | awk '{print $2}' | awk '{split($0,a,\"/\"); print a[1]}')"
fi
