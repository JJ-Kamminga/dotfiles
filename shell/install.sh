#!/bin/sh

# Create necessary directories
mkdir -p ~/.config/shell

# zoxide
if ! command -v zoxide >/dev/null 2>&1; then
    echo "Installing zoxide..."
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

# fzf
if [ ! -d "$HOME/.fzf" ]; then
    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all --no-fish
fi

echo "Shell utilities installation complete!"
