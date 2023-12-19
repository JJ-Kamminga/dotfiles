for DOTFILE in `find ~/dotfiles/bash/source`
do
  if [ -f "$DOTFILE" ]; then
    source "$DOTFILE"
    echo succesfully sourced "$DOTFILE"
  fi
done

# GNOME doesn't source .bashrc by default
source ~/.bashrc
echo succesfully sourced ~/.bashrc