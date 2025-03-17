#!/bin/sh

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# List directory contents
alias l='ls -lah'

# Git
alias check='git checkout'
alias add='git add .'
alias push='git push'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Common shortcuts
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
