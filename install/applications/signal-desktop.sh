if ! command -v signal-desktop &> /dev/null; then
  sudo apt install -y signal-desktop > /dev/null
else
  gum log --level info "found signal-desktop"
fi
