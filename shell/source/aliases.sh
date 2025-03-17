#!/bin/sh

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# List directory contents
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'

# Git shortcuts
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gst='git status'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias check='git checkout'
alias add='git add .'
alias push='git push'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Common shortcuts
alias h='history'
alias c='clear'
alias x='clear'
alias mkdir='mkdir -p'
alias reload='exec "$SHELL"'
alias week='date +%V'

# Language shortcuts
alias python='python3.11'
alias activate='source .venv/bin/activate'
alias nvm='fnm'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Show human readable file sizes
alias df='df -h'
alias du='du -h'
