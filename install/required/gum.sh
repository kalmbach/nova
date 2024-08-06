if ! command -v gum &> /dev/null; then
  echo "Installing gum..."

  cd /tmp
  GUM_VERSION="0.14.3"
  GUM_PACKAGE="gum_${GUM_VERSION}_amd64.deb"
  wget -O $GUM_PACKAGE "https://github.com/charmbracelet/gum/releases/download/v0.14.3/gum_0.14.3_amd64.deb"
  sudo apt install -y ./$GUM_PACKAGE
  rm $GUM_PACKAGE 
  cd -
fi
