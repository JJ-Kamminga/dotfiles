#!/bin/sh
# Cross-platform PATH configuration

# Base PATH setup
[ -d "/usr/local/bin" ] && PATH="/usr/local/bin:$PATH"
[ -d "/usr/bin" ] && PATH="/usr/bin:$PATH"
[ -d "/bin" ] && PATH="/bin:$PATH"
[ -d "/usr/sbin" ] && PATH="/usr/sbin:$PATH"
[ -d "/sbin" ] && PATH="/sbin:$PATH"

# User-specific paths
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/go/bin" ] && PATH="$HOME/go/bin:$PATH"
[ -d "$DOTFILES_DIR/bin" ] && PATH="$PATH:$DOTFILES_DIR/bin"
[ -d "/usr/local/go/bin" ] && PATH=$PATH:/usr/local/go/bin

export PATH 
