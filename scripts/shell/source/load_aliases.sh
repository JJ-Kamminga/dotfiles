#!/bin/sh

# Shared aliases
if [ -f "$HOME/dotfiles/scripts/shell/source/aliases.sh" ]; then
    . "$HOME/dotfiles/scripts/shell/source/aliases.sh"
fi

# Secret aliases
if [ -f "$HOME/dotfiles/scripts/shell/source/aliases_secret.sh" ]; then
    . "$HOME/dotfiles/scripts/shell/source/aliases_secret.sh"
fi

# Detect platform and load specific aliases
case "$(uname -s)" in
    Linux*)
        if [ -f "$HOME/dotfiles/scripts/ubuntu/aliases.sh" ]; then
            . "$HOME/dotfiles/scripts/ubuntu/aliases.sh"
        fi
        ;;
    Darwin*)
        if [ -f "$HOME/dotfiles/scripts/macos/aliases.sh" ]; then
            . "$HOME/dotfiles/scripts/macos/aliases.sh"
        fi
        ;;
esac
