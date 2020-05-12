# path
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# vim
alias vi='vim'

# emacs
alias emad='emacs --daemon'
alias e='emacsclient -t'
alias ec='emacsclient -nc'

# python
alias venv='[ ! -d venv ] && python3 -m venv venv; . venv/bin/activate'

# git
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gclean='git clean -id'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph'
alias gm='git merge'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gr='git remote'
alias gra='git remote add'
alias grbi='git rebase -i'
alias grhh='git reset --hard'
alias gsb='git status -sb'
alias gsta='git stash push'
alias gstp='git stash pop'

# docker-compose
alias dcb='docker-compose build'
alias dcdn='docker-compose down'
alias dce='docker-compose exec'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias dco=docker-compose
alias dcps='docker-compose ps'
alias dcpull='docker-compose pull'
alias dcr='docker-compose run'
alias dcrestart='docker-compose restart'
alias dcrm='docker-compose rm'
alias dcstart='docker-compose start'
alias dcstop='docker-compose stop'
alias dcup='docker-compose up'
alias dcupd='docker-compose up -d'

# i am so cuet
alias claer='clear'
alias clera='clear'
alias celar='clear'
