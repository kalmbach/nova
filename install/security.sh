if ! command -v ufw &> /dev/null; then
  p "installing ufw..."
  sudo apt-get install -y ufw | log
fi

firewall_status=$(sudo ufw status | awk '{print $2}')

if [ "$firewall_status" = "active" ]; then
  p "firewall enabled..."
else
  p "enabling firewall..."
  sudo ufw enable
  sudo ufw status verbose
fi
