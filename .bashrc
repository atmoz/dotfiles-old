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

function color() {
    echo "\[\e[${1}m\]${@:2}\[\e[m\]"
}

function __ps1_newline_login {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    #printf '\n'
    line=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' '  '-')
    dateString=" $(date +"%F %T")"
    printf '\e[0;37m'
    printf -- "${line:${#dateString}}${dateString}"
    printf '\e[0m'
  fi
}
PROMPT_COMMAND='__ps1_newline_login'

source /usr/share/git/completion/git-prompt.sh
#GIT_PS1_SHOWUPSTREAM="auto"
#GIT_PS1_SHOWUNTRACKEDFILES=true

#PS1='[\u@\h \W]\$ '
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
#PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] $(__git_ps1 "[%s]") \n\[\e[1;32m\]\$\[\e[m\] '
gitPsInfo='$(__git_ps1 " [%s]")'
#PS1="\n$(color $dgreen [)$(color $blue '\w')$(color $green $gitPsInfo)$(color $dgreen ]) $(color $dgreen \$) "
PS1="$(color $dblue '\w')$(color $green $gitPsInfo) \$ "
