if gum confirm "install shotcut?"; then
  if ! flatpak run org.shotcut.Shotcut --version &> /dev/null; then
    gum log --level info "installing shotcut..."
    flatpak install -y flathub org.shotcut.Shotcut
  else
    gum log --level info "found shotcut $(flatpak run org.shotcut.Shotcut --version | awk '{print $NF}')"
  fi
fi
