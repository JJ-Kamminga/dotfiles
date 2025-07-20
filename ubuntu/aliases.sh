#!/bin/sh

# Ubuntu-specific aliases

# Use batcat instead of cat (Ubuntu package name is different)
if command -v batcat >/dev/null 2>&1; then
    alias cat='batcat'
fi

# Package management
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias install='sudo apt install'
alias remove='sudo apt remove'

# Service management
alias sstart='sudo systemctl start'
alias sstop='sudo systemctl stop'
alias srestart='sudo systemctl restart'
alias sstatus='sudo systemctl status'

# Common Ubuntu tools
alias xo='xdg-open'
alias open='xdg-open'  # Make it more Mac-like

# Docker
alias docker='podman'
alias docker-compose='podman-compose'

alias jmeter='cd ~/../../opt/apache-jmeter-5.6.3/bin && ./jmeter'