# directories
alias -- -='cd -'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias d='dirs -v'

alias l='ls -lah'
alias ls='ls --color=tty'

# i am sure that you are not expecting cp overwrites sth
alias cp='cp -i'
# alias rm='rm -I'

cdtemp() {
  PREV_DIR=$(pwd)
  TEMP_DIR=$(mktemp -d)
  cd $TEMP_DIR
  $SHELL
  read "cleanup?rm -rf $TEMP_DIR? [Y/n] "
  if [[ ! "$cleanup" =~ "^[nN]$" ]]
  then
    \rm -rf $TEMP_DIR
  fi
  cd $PREV_DIR
}

# vim
alias vi='nvim'

# python
alias python='python3'
alias pip='pip3'
alias venv='[ ! -d venv ] && python3 -m venv venv; . venv/bin/activate'

# git
alias ga='git add'
alias gaa='git add --all'
alias gae='git add --edit'
alias gapa='git add --patch'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbv='git branch -vv'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcl='git clone --recurse-submodules'
alias gclean='git clean -fd'
alias gd='git diff'
alias gds='git diff --staged'
alias gdt='git difftool'
alias gdts='git difftool --staged'
alias gl='git pull'
glu() {git pull upstream $(LC_ALL=C git remote show upstream | sed -n '/HEAD branch/s/.*: //p')}
alias glog='git log --oneline --decorate --graph'
alias glogd="git log --format='%C(auto)%h %s %Cblue(%an, %cr)' @{1}.."
alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git push'
alias gp!='git push --force-with-lease'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grh='git reset'
alias grhh='git reset --hard'
alias gsb='git status -sb'
alias gsta='git stash push'
alias gstp='git stash pop'
alias gwip='git checkout wip || git checkout -b wip && git add --all && git commit -m "[WIP]" && git push -u origin wip'
alias gunwip='git pull && git branch wip origin/wip && git merge --squash --ff wip && git branch -d wip && git push origin :wip && git reset'

# i am so cuet
alias claer='clear'
alias clera='clear'
alias celar='clear'
