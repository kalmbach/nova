if gum confirm "install gimp?"; then
  if ! flatpak run org.gimp.GIMP --version &> /dev/null; then
    gum log --level info "installing gimp..."
    flatpak install -y flathub org.gimp.GIMP
  else
    gum log --level info "found gimp $(flatpak run org.gimp.GIMP --version | awk '{print $NF}')"
  fi
fi
