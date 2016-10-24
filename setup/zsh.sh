if [ $(uname) = 'Linux' ]
then
    sudo apt install zsh
fi

if [ $SHELL != $(which zsh) ]
then
    chsh -s $(which zsh)
fi

if [ ! -d ~/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

mv -f ~/.zshrc ~/dotfiles/dotfiles_old/zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc
mkdir -p ~/.oh-my-zsh/custom/themes
ln -s ~/dotfiles/oh-my-zsh/custom/themes/* ~/.oh-my-zsh/custom/themes
