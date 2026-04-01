if ! command -v ufw &> /dev/null; then
  p "installing ufw..."
  sudo apt-get install -y ufw | log
fi

p "enabling firewall..."
sudo ufw enable
sudo ufw status verbose
