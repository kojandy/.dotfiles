source ~/.zgen/zgen.zsh
if ! zgen saved; then
    zgen oh-my-zsh

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/autojump
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/docker-compose

    zgen save
fi

source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/theme.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User configuration

PATH=~/.dotfiles/bin:$PATH
stty -ixon
unsetopt AUTO_CD

if command -v tmux>/dev/null; then
    if [[ ! $TERM =~ screen ]] && [ -z $TMUX ]; then
        if tmux ls&>/dev/null; then
            exec tmux attach-session -t $(tmux ls | tail -n 1 | awk '{ print $1 }')
        else
            exec tmux
        fi
    fi
fi
