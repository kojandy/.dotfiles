if [ $(uname) = 'Linux' ]
then
    sudo apt install vim
fi

mv -f ~/.vimrc ~/dotfiles/dotfiles_old/vimrc
ln -s ~/dotfiles/vimrc ~/.vimrc
