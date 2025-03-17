#!/bin/sh

# macOS-specific aliases

# Use bat instead of cat (macOS homebrew package name)
if command -v bat >/dev/null 2>&1; then
    alias cat='bat'
fi

# macOS specific commands
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias wallpaper="bash $HOME/dotfiles/macos/wallpaper.sh"
