if ! command -v lua-language-server &> /dev/null; then
  gum log --level info "installing lua-language-server..."
  mkdir -p ~/.local/lua_ls
  cd ~/.local/lua_ls
  wget "https://github.com/LuaLS/lua-language-server/releases/download/3.10.3/lua-language-server-3.10.3-linux-x64.tar.gz"
  tar -xzf lua-language-server-3.10.3-linux-x64.tar.gz
  rm lua-language-server-3.10.3-linux-x64.tar.gz
  cd -

  mkdir -p ~/.local/bin
  ln -s ~/.local/lua_ls/bin/lua-language-server ~/.local/bin/lua-language-server
else
  gum log --level info "found lua-language-server $(lua-language-server --version)"
fi
