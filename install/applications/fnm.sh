if ! command -v fnm &> /dev/null; then
  p "installing fnm..."
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell | log
  
  p "modifying .bashrc to setup fnm..."
  echo "" >> ~/.bashrc
  echo "# fnm" >> ~/.bashrc
  echo "export PATH=\"\$PATH:\$HOME/.local/share/fnm\"" >> ~/.bashrc
  echo "eval \"\`fnm env --use-on-cd\`\"" >> ~/.bashrc

  source ~/.bashrc
else
  p "found fnm $(fnm --version | awk '{print $2}')"
fi
