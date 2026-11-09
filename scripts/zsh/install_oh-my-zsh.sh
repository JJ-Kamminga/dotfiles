# oh-my-zsh
ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# p10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ln -svi ~/dotfiles/zsh/.p10k.zsh ~
# fzf tab
fzf_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
if [ ! -d "$fzf_dir" ] || [ -z "$(ls -A $fzf_dir)" ]; then
    git clone https://github.com/Aloxaf/fzf-tab $fzf_dir
fi

# replace the current shell with zsh
exec zsh