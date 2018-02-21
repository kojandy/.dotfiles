#!/bin/sh
if [ ! -d ~/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ -e ~/.zshrc ]
then
    mv -f ~/.zshrc ~/.dotfiles/dotfiles_old/zshrc
fi
ln -s ~/.dotfiles/zshrc ~/.zshrc
