export ZSH=~/.oh-my-zsh

ZSH_THEME="custom"
ZSH_CUSTOM=~/.dotfiles/zsh

plugins=(git vi-mode sudo)

source $ZSH/oh-my-zsh.sh


# User configuration

PATH=~/.dotfiles/bin:$PATH

stty -ixon

if command -v tmux>/dev/null; then
    if [[ ! $TERM =~ screen ]] && [ -z $TMUX ]; then
        if tmux ls&>/dev/null; then
            exec tmux attach-session -t $(tmux ls | tail -n 1 | awk '{ print $1 }')
        else
            exec tmux
        fi
    fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/autojump/autojump.sh ] && source /usr/share/autojump/autojump.sh
