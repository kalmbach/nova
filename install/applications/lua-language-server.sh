if ! command -v lua-language-server &> /dev/null; then
  p "installing lua-language-server..."

  mkdir -p ~/.local/lua-language-server
  cd ~/.local/lua-language-server
  wget -qnv -O lua-language-server.tar.gz "https://github.com/LuaLS/lua-language-server/releases/download/3.17.1/lua-language-server-3.17.1-linux-x64.tar.gz"
  tar -xzf lua-language-server.tar.gz 
  rm lua-language-server.tar.gz
  cd -

  mkdir -p ~/.local/bin
  ln -s ~/.local/lua-language-server/bin/lua-language-server ~/.local/bin/lua-language-server
else
  p "found lua-language-server $(lua-language-server --version)"
fi
