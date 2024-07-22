if ! command -v fnm &> /dev/null; then
  gum log --level info "installing fnm..."
  curl -fsSL https://fnm.vercel.app/install | bash
else
  gum log --level info "found fnm $(fnm --version | awk '{print $2}')"
fi
