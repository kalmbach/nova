if ! command -v glow &> /dev/null; then
  p "installing glow..."
  go install github.com/charmbracelet/glow/v2@latest | log
else
  p "found glow $(glow version | awk 'NR==2{print $1}')"
fi
