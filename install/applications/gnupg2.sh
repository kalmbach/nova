if ! command -v gpg2 &> /dev/null; then
  p "installing gnupg2..."
  sudo apt-get install -y gnupg2 | log
else
  p "found gnupg2 $(gpg2 --version | awk 'NR==1{print $3}')"
fi
