#!/bin/sh

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# List directory contents
alias l='ls -lah'

# Git
alias checkout='git checkout'
alias add='git add .'
alias push='git push'
alias pull='git pull'
alias diff='git diff'
alias fetch='git fetch'
alias branch='git branch'
alias save='git add . && git commit -m "generic commit message" && git push'

# Grep with color
alias grep='grep --color=auto'
alias rg='rgrep'

# Common shortcuts
alias x='clear'
alias mkdir='mkdir -p'
alias reload='export ZSH_RELOAD=1 && source ~/.zshrc'
alias reset='exec "$SHELL"'
alias week='date +%V'

# misc app aliases
alias tw='task'

# Language shortcuts
# alias python='python3.13.2'
alias activate='source .venv/bin/activate'
alias nvm='fnm'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# custom scripts
alias j2grafana='~/dotfiles/shell/bash/scripts/ansible_j2_to_grafana_json.sh'
alias jtl2topaths="awk -F',' '{print $14}' 500-errors-from-final-test.jtl | sed 's|.*.dmz.kb\.nl||g' > 500-errors-from-final-test-testdata.csv"