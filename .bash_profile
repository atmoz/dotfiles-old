#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X only if tty1 with no errors
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ ! -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
  exec startx & exit
fi
