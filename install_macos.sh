###############################################################################
# Configs                                                                     #
###############################################################################
# bash
ln -svi ~/dotfiles/bash/.bash_profile ~

# zsh
ln -svi ~/dotfiles/zsh/.zshrc ~

# git
bash git/set_gitconfig.sh

# macos defaults
source macos/macosdefaults.sh

###############################################################################
# Installations                                                               #
###############################################################################
# brew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# add to path
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/jkamminga/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

# homebrew
## installations
brew install git
brew install node

## casks
# these only need to be enabled on first system install
# brew install --cask iterm2
# brew install --cask firefox
# brew install --cask spotify
# brew install --cask visual-studio-code

read -e -p "Install Ruby?" choice [[ "$choice" == [Yy]* ]]\
    &&\
        brew install chruby\
        brew install ruby-install\
        ruby-install ruby\
    || echo "skipping Ruby installation."

# oh-my-zsh
source zsh/install_oh-my-zsh.sh
# install general shell utilities
source shell/install.sh

# customisation
## wallpaper
bash /Users/jkamminga/dotfiles/macos/wallpaper.sh