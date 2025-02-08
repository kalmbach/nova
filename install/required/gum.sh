if ! command -v gum &> /dev/null; then
  echo "Installing gum..."

  cd /tmp
  GUM_VERSION="0.15.2"
  GUM_PACKAGE="gum_${GUM_VERSION}_amd64.deb"
  wget -nv -O $GUM_PACKAGE "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/${GUM_PACKAGE}"
  sudo apt-get install -y ./$GUM_PACKAGE | log
  rm $GUM_PACKAGE 
  cd -
fi

gum log --level info \
  "found gum $(gum --version | awk '{print $3}' | sed s/^v//)"
