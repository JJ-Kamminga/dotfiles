###############################################################################
# Configs                                                                     #
###############################################################################
# bash
ln -svi ~/dotfiles/bash/.bash_profile ~

# source bash, so the new profile can be used right away
source ~/.bash_profile

# git
bash git/set_gitconfig.sh

# ubuntu defaults
source ubuntu/ubuntudefaults.sh

###############################################################################
# Installations                                                               #
###############################################################################

# Git
sudo apt-get install git-all

# Tweaks
sudo apt install gnome-tweaks

#