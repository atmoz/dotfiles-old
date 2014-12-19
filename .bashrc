#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto --group-directories-first -p'
PS1='[\u@\h \W]\$ '

set -o vi
export EDITOR="vim"

export PATH=$PATH:~/bin

export GOPATH=~/workspace/go
export PATH=$PATH:$GOPATH/bin

# git magic
alias gs='git s'
alias gl='git log'
alias gd='git diff'
alias gdc='git diff --cached'
alias ga='git add'
alias gm='git commit -m'
alias gam='git commit -am'
alias gc='git checkout'
alias gpp='git pull && git push'


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.light.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


black="0;30"
blue="0;34"
green="0;32"
cyan="0;36"
red="0;31"
yellow="0;33"
purple="0;35"
white="0;37"

dblack="1;30"
dblue="1;34"
dgreen="1;32"
dcyan="1;36"
dred="1;31"
dyellow="1;33"
dpurple="1;35"
dwhite="1;37"

function __color() {
    echo "\[\e[${1}m\]${@:2}\[\e[m\]"
}

GIT_PS1_SHOWUPSTREAM="auto"
#GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true
source /usr/share/git/completion/git-prompt.sh

function __ps1_newline_login {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true

    gitPsInfo='$(__git_ps1  "[%s] ")'
    PS1="${PS1/\$/$gitPsInfo\$}"
  else
    #printf '\n'
    line=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' '  '-')
    dateString="" # " $(date +"%F %T")"
    printf '\e[0;37m'
    printf -- "${line:${#dateString}}${dateString}"
    printf '\e[0m'
  fi
}

ps1pc_start="$(__color $dblue '\w') "
ps1pc_end='$(if [ ! \j == 0 ]; then echo "(\jj) "; fi)\$ '
PROMPT_COMMAND='__ps1_newline_login && __git_ps1 "$ps1pc_start" "$ps1pc_end" "[%s]"'


