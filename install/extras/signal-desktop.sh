if gum confirm "install signal desktop?"; then
  if ! command -v signal-desktop &> /dev/null; then
    gum log --level info "installing signal-desktop..."
    sudo apt install -y signal-desktop > /dev/null
  else
    gum log --level info "found signal-desktop"
  fi
fi
