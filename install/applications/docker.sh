if ! command -v docker &> /dev/null; then
  gum log --level info "installing docker..."
  cd /tmp
  wget -O docker-desktop-amd64.deb "https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb"
  sudo apt install -y ./docker-desktop-amd64.deb
  cd -
else
  gum log --level info "found docker $(docker --version | awk '{print $3}')"
fi
