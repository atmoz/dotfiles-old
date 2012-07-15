xrdb -merge .Xresources

if (xrandr | grep "DVI-I-2" | grep " connected"); then
    ~/bin/toggle-monitor.sh external
fi

exec i3 --force-xinerama -V >>~/.i3/i3log 2>&1
