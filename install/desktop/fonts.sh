mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.zip
unzip FiraMono.zip -d FiraFont
cp FiraFont/*.otf ~/.local/share/fonts
rm -rf FiraMono.zip FiraFont

fc-cache
cd -
