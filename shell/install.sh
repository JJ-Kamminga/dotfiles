#!/bin/sh

# Create necessary directories
mkdir -p ~/.config/shell

# Source our shell configurations in rc files
for rc in ~/.bashrc ~/.zshrc; do
    if [ -f "$rc" ]; then
        # Check if our source line is already there
        if ! grep -q "source ~/dotfiles/shell/source/load_aliases.sh" "$rc"; then
            echo "\n# Load shell configurations" >> "$rc"
            echo "source ~/dotfiles/shell/source/load_aliases.sh" >> "$rc"
            echo "source ~/dotfiles/shell/source/path.sh" >> "$rc"
            echo "source ~/dotfiles/shell/source/prompt.sh" >> "$rc"
        fi
    fi
done

# Install additional tools

# zoxide - smart directory jumper
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# fzf - fuzzy finder
if [ ! -d "~/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi

echo "Shell utilities installation complete!"
