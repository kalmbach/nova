cd /tmp
GUM_VERSION="0.14.1"
GUM_PACKAGE="gum_${GUM_VERSION}_amd64.deb"
echo $GUM_PACKAGE
wget -qO $GUM_PACKAGE "https://github.com/charmbracelet/gum/releases/latest/download/${GUM_PACKAGE}"
sudo apt-get install -y ./$GUM_PACKAGE
rm $GUM_PACKAGE 
cd -
