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
mkdir -p ~/.oh-my-zsh/custom/themes
mkdir -p ~/.dotfiles/dotfiles_old/oh-my-zsh/custom/themes
if [ -e ~/.oh-my-zsh/custom/themes ]
then
    mv -f ~/.oh-my-zsh/custom/themes ~/.dotfiles/dotfiles_old/oh-my-zsh/custom/themes
fi
ln -s ~/.dotfiles/oh-my-zsh/custom/themes/ ~/.oh-my-zsh/custom
if [ -e ~/.oh-my-zsh/custom/alias.zsh ]
then
    mv -f ~/.oh-my-zsh/custom/alias.zsh ~/.dotfiles/dotfiles_old/oh-my-zsh/custom/alias.zsh
fi
ln -s ~/.dotfiles/oh-my-zsh/custom/alias.zsh ~/.oh-my-zsh/custom/alias.zsh
