#!/bin/sh
if [ -e ~/.gitconfig ]
then
    mv -f ~/.gitconfig ~/.dotfiles/_old/gitconfig
fi
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

if [ -e ~/.gitignore_global ]
then
    mv -f ~/.gitignore_global ~/.dotfiles/_old/gitignore_global
fi
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
