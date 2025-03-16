#!/bin/sh
# Cross-platform aliases that work in both bash and zsh

# Navigation
alias l="ls -la"       # List in long format, include dotfiles
alias ld="ls -ld */"   # List in long format, only directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Shell
if [ -n "$BASH_VERSION" ]; then
    alias reload='source ~/.bash_profile'
else
    alias reload='source ~/.zshrc'
fi

alias week='date +%V'
alias x='clear'

# Git
alias check='git checkout'
alias add='git add .'
alias push='git push'

# Languages
alias python='python3.11'
alias activate='source .venv/bin/activate'
alias nvm='fnm'

# Cleanup
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
