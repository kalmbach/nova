cd /tmp
wget -q -O mononoki.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Mononoki.zip"
unzip -q $NOVA_PATH/install/fonts/mononoki.zip -d MononokiFont
cp MononokiFont/*.ttf ~/.local/share/fonts
rm -rf mononoki.zip MononokiFont 
cd -
