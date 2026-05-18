if ! command -v gum &> /dev/null; then
  p "installing gum..."
  go install github.com/charmbracelet/gum@latest | log
else
  p "found gum $(gum --version | awk '{print $3}')"
fi
