# colors
if [[ $terminfo[colors] -ge 256 ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
    yellow="%F{11}"
else
    turquoise="%F{cyan}"
    orange="%F{yellow}"
    purple="%F{magenta}"
    hotpink="%F{red}"
    limegreen="%F{green}"
    yellow="%F{yellow}"
fi

# git
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="~"
ZSH_THEME_GIT_PROMPT_DELETED='―'
ZSH_THEME_GIT_PROMPT_RENAMED="&"
ZSH_THEME_GIT_PROMPT_STASHED="$"
ZSH_THEME_GIT_PROMPT_UNMERGED="!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_AHEAD="♯"
ZSH_THEME_GIT_PROMPT_BEHIND="♭"
ZSH_THEME_GIT_PROMPT_DIVERGED="↕"

# components
export VIRTUAL_ENV_DISABLE_PROMPT=1

function _user_host() {
    echo "%(?.$turquoise.$orange)%n@%m:"
}

function _current_dir() {
    local _max_pwd_length="65"
    local _path
    if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
        _path="%-2~ ⵈ %3~"
    else
        _path="%~"
    fi
    echo "%{$limegreen%}%B${_path}%b"
}

function _git_info() {
    git status&>/dev/null && echo " %{$yellow%}‹$(git_prompt_info)$(git_prompt_status)›"
}

function _virtualenv_info {
    [ $VIRTUAL_ENV ] && echo " %{$hotpink%}[$(basename $VIRTUAL_ENV)]"
}

function _caret() {
    local _caret_color
    if [[ $KEYMAP == "vicmd" ]]; then
        _caret_color=$limegreen
    else
        _caret_color=$turquoise
    fi
    echo "${_caret_color}%(!.#.$)%f"
}


# prompts
PROMPT='
$(_user_host)$(_current_dir)$(_git_info)$(_virtualenv_info)
$(_caret) '

RPROMPT=''
