#!/bin/sh

# First load shared aliases
if [ -f "$HOME/dotfiles/shell/source/aliases.sh" ]; then
    . "$HOME/dotfiles/shell/source/aliases.sh"
    echo "Loaded shared aliases"
fi

# Detect platform and load specific aliases
case "$(uname -s)" in
    Linux*)
        if [ -f "$HOME/dotfiles/ubuntu/aliases.sh" ]; then
            . "$HOME/dotfiles/ubuntu/aliases.sh"
            echo "Loaded Ubuntu aliases"
        fi
        ;;
    Darwin*)
        if [ -f "$HOME/dotfiles/macos/aliases.sh" ]; then
            . "$HOME/dotfiles/macos/aliases.sh"
            echo "Loaded macOS aliases"
        fi
        ;;
esac
