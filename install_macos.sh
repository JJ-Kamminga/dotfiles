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

# homebrew installations
brew install git
brew install node

# homebrew cask installations
brew install --cask iterm2
brew install --cask firefox
brew install --cask spotify
brew install --cask visual-studio-code

# oh-my-zsh
source zsh/install_oh-my-zsh.sh
# install general shell utilities
source shell/install.sh

# customisation
wallpaper