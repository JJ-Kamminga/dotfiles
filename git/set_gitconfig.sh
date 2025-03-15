
# prompt for email, if left empty set noreply email
read -e -p "Set an email for git config (leave empty for a noreply address): " email

# Check if the email variable is empty
if [[ -z "$email" ]]; then
    email="43784616+JJ-Kamminga@users.noreply.github.com"
fi

git config --global user.email "$email" 
git config --global user.name "Jakob Jan Kamminga"
git config --global core.editor "nano"
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.dark true
git config --global merge.conflictstyle zdiff3
