#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X only if tty1 with no errors
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ ! -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
	if (xrandr | grep "DVI-I-2" | grep " connected"); then
		~/bin/toggle-monitor.sh external
	fi
	exec startx & exit
fi
