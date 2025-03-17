#!/bin/sh

# First load shared aliases
if [ -f "$HOME/dotfiles/shell/source/aliases.sh" ]; then
    . "$HOME/dotfiles/shell/source/aliases.sh"
fi

# Detect platform and load specific aliases
case "$(uname -s)" in
    Linux*)
        if [ -f "$HOME/dotfiles/ubuntu/aliases.sh" ]; then
            . "$HOME/dotfiles/ubuntu/aliases.sh"
        fi
        ;;
    Darwin*)
        if [ -f "$HOME/dotfiles/macos/aliases.sh" ]; then
            . "$HOME/dotfiles/macos/aliases.sh"
        fi
        ;;
esac
