if ! command -v unzip &> /dev/null; then
  p "installing unzip..."
  sudo apt-get install -y unzip | log
else
  p "found unzip $(unzip -v | awk 'NR==1{print $2}')"
fi
