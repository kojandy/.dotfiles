#!/bin/sh
if [ -e ~/.gitconfig ]
then
    mv -f ~/.gitconfig ~/.dotfiles/dotfiles_old/gitconfig
fi
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
