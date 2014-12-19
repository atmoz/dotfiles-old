xrdb -merge .Xresources
xsetroot -solid black &

rm ~/.i3/i3log
exec i3 --force-xinerama -V >>~/.i3/i3log 2>&1
