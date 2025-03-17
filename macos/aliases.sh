#!/bin/sh

# macOS-specific aliases

# Use bat instead of cat (macOS homebrew package name)
if command -v bat >/dev/null 2>&1; then
    alias cat='bat'
fi

# Package management
alias brew='brew'
alias bupdate='brew update'
alias bupgrade='brew upgrade'
alias binstall='brew install'
alias buninstall='brew uninstall'

# macOS specific commands
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# Clipboard
alias pbp='pbpaste'
alias pbc='pbcopy'
