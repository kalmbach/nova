if ! command -v spotify &> /dev/null; then
  p "installing spotify..."
  curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
  echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list >/dev/null

  sudo apt-get update | log
  sudo apt-get install -y spotify-client | log
else
  p "found spotify $(spotify --version | awk '{print $3}')"
fi
