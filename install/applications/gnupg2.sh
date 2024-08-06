if ! command -v gpg2 &> /dev/null; then
  gum log --level info "installing gnupg2..."

  sudo apt install -y gnupg2
else
  gum log --level info "found gnupg2 $(gpg2 --version | awk 'NR==1{print $3}')"
fi
