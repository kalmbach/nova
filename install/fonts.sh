p "check mononoki nerd fonts..."
if [ ! -f "$HOME/.local/share/fonts/MononokiNerdFontMono-Regular.ttf" ]; then
  read -p "Install Mononoki nerd fonts? (y/n): " -n 1 -r yn
  echo

  if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
    if ! command -v fc-cache &> /dev/null; then
      p "installing fontconfig..."
      sudo apt-get install -y fontconfig | log
    fi

    p "making ~/.local/share/fonts dir..."
    mkdir -p ~/.local/share/fonts

    p "installing mononoki fonts..."
    cd /tmp
    wget -q -O mononoki.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Mononoki.zip"
    unzip -q mononoki.zip -d MononokiFont
    cp MononokiFont/*.ttf ~/.local/share/fonts
    rm -rf mononoki.zip MononokiFont
    cd -

    p "refreshing font cache..."
    fc-cache
  fi
 fi
