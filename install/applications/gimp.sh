if ! flatpak run org.gimp.GIMP --version &> /dev/null; then
  flatpak install flathub org.gimp.GIMP
else
  gum log --level info "found gimp $(flatpak run org.gimp.GIMP --version | awk '{print $NF}')"
fi
