if ! command -v slack &> /dev/null; then
  gum log --level info "installing slack..."
  cd /tmp
  wget -O slack-desktop.deb "https://slack.com/downloads/instructions/linux?ddl=1&build=deb"
  sudo apt install -y ./slack-desktop.deb
  rm slack-desktop.deb
  cd -
else
  gum log --level info "found slack $(slack --version)"
fi
