cd /tmp
wget -q https://github.com/madmalik/mononoki/releases/download/1.6/mononoki.zip
unzip -q mononoki.zip -d MononokiFont 
cp MononokiFont/*.ttf ~/.local/share/fonts
rm -rf mononoki.zip MononokiFont 
cd -
