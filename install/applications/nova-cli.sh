p "installing nova-cli..."

mkdir -p ~/.local/bin
cp "$NOVA_PATH/bin/nova" "$HOME/.local/bin/nova"

mkdir -p ~/.local/share/bash-completion/completions
cp "$NOVA_PATH/bin/nova-completion.bash" "$HOME/.local/share/bash-completion/completions/nova"

source "$NOVA_PATH/bin/nova-aliases"
