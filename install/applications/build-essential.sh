p "installing build essentials..."
sudo apt-get install -y autoconf patch build-essential libssl-dev \
  libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev \
  libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev | log
echo ""
