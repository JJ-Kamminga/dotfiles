for DOTFILE in `find /Users/jkamminga/dotfiles/bash/source`
do
  if [ -f "$DOTFILE" ]; then
    source "$DOTFILE"
    echo succesfully sourced "$DOTFILE"
  fi
done