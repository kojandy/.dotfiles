export ZSH=~/.oh-my-zsh

ZSH_THEME="custom"
DISABLE_AUTO_TITLE="true"
ZSH_CUSTOM=~/.dotfiles/oh-my-zsh

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh


# User configuration

if command -v tmux>/dev/null; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

stty -ixon
