if ! command -v fnm &> /dev/null; then
  gum log --level info "installing fnm..."
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
  
  echo "" >> ~/.bashrc
  echo "# fnm" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$HOME/.local/share/fnm\"" >> ~/.bashrc
  echo "eval \"\`fnm env --use-on-cd\`\"" >> ~/.bashrc

  source ~/.bashrc
else
  gum log --level info "found fnm $(fnm --version | awk '{print $2}')"
fi
