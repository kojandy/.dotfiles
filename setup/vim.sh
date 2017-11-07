#!/bin/sh
if [ -e ~/.vimrc ]
then
    mv -f ~/.vimrc ~/.dotfiles/dotfiles_old/vimrc
fi
ln -s ~/.dotfiles/vimrc ~/.vimrc
