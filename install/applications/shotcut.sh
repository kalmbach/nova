
if ! flatpak run org.shotcut.Shotcut --version &> /dev/null; then
  flatpak install flathub org.shotcut.Shotcut
else
  gum log --level info "found shotcut $(flatpak run org.shotcut.Shotcut --version | awk '{print $NF}')"
fi
