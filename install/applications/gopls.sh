if ! command -v gopls &> /dev/null; then
  p "installing go-language-server..."
  go install golang.org/x/tools/gopls@latest | log
else
  p "found gopls $(gopls version | awk '{print $2}')" 
fi
