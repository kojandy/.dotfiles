#!/bin/sh
if [ -e ~/.gitconfig ]
then
    mv -f ~/.gitconfig ~/.dotfiles/_old/gitconfig
fi
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
