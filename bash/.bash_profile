#!/bin/bash

## Some terminals (like GNOME) don't source .bashrc by default
. ~/.bashrc
echo succesfully sourced ~/.bashrc

for DOTFILE in `find ~/dotfiles/shell/source`
do
  if [ -f "$DOTFILE" ]; then
    . "$DOTFILE"
    echo succesfully sourced "$DOTFILE"
  fi
done

for DOTFILE in `find ~/dotfiles/bash/source`
do
  if [ -f "$DOTFILE" ]; then
    . "$DOTFILE"
    echo succesfully sourced "$DOTFILE"
  fi
done

# zoxide
eval "$(zoxide init bash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && . "$HOME/.sdkman/bin/sdkman-init.sh"
