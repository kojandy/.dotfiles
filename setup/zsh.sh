#!/bin/sh
if [ ! -d ~/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

mv -f ~/.zshrc ~/.dotfiles/dotfiles_old/zshrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
mkdir -p ~/.oh-my-zsh/custom/themes
mkdir -p ~/.dotfiles/dotfiles_old/oh-my-zsh/custom/themes
mv -f ~/.oh-my-zsh/custom/themes ~/.dotfiles/dotfiles_old/oh-my-zsh/custom/themes
ln -s ~/.dotfiles/oh-my-zsh/custom/themes/ ~/.oh-my-zsh/custom
mv -f ~/.oh-my-zsh/custom/alias.zsh ~/.dotfiles/dotfiles_old/oh-my-zsh/custom/alias.zsh
ln -s ~/.dotfiles/oh-my-zsh/custom/alias.zsh ~/.oh-my-zsh/custom/alias.zsh
