#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

wal -R
dunst &
mpd &
xbindkeys &
unclutter &
picom &
xsettingsd &
# Just assume we're in brisbane.
redshift -l "-27:153" &
keynav daemonize &
dwmblocks &
#pipewire &
xss-lock slock.sh &
exec ssh-agent dbus-launch --sh-syntax --exit-with-session dwm
