if [ ! -d ~/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

mv -f ~/.zshrc ~/.dotfiles/dotfiles_old/zshrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
mkdir -p ~/.oh-my-zsh/custom/themes
mv -f ~/.oh-my-zsh/custom/themes ~/.dotfiles/oh-my-zsh/custom/themes
ln -s ~/.dotfiles/oh-my-zsh/custom/themes/* ~/.oh-my-zsh/custom/themes
mv -f ~/.oh-my-zsh/custom/alias.zsh ~/.dotfiles/oh-my-zsh/custom/alias.zsh
ln -s ~/.dotfiles/oh-my-zsh/custom/alias.zsh ~/.oh-my-zsh/custom/alias.zsh
