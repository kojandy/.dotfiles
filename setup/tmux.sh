#!/bin/sh
if [ -e ~/.tmux.conf ]
then
    mv -f ~/.tmux.conf ~/.dotfiles/dotfiles_old/tmux.conf
fi
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
