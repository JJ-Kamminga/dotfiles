# Some terminals (like GNOME) don't source .bashrc by default
source ~/.bashrc
echo succesfully sourced ~/.bashrc

for DOTFILE in `find ~/dotfiles/bash/source`
do
  if [ -f "$DOTFILE" ]; then
    source "$DOTFILE"
    echo succesfully sourced "$DOTFILE"
  fi
done

eval "$(zoxide init bash)"