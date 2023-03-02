for DOTFILE in `find /Users/jkamminga/*/dotfiles/macos`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done