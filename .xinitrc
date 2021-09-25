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
# Always bind keys
xbindkeys &

# EPIC GAMER MODE!!!!! XDXDXD
[ -n "$GAMERMODE" ] && exec steam

# Only do this if *not* in epic gamer mode :(
dunst &
mpd &
unclutter &
# TODO: causes game crashes on newest version of X, fix before reenabling -Dther, 2021-07-13
# XXX: Only happens on Intel CPUs tho
# picom &
xsettingsd &
# Just assume we're in brisbane.
redshift -l "-27:153" &
keynav daemonize &
dwmblocks &
#pipewire &
xss-lock slock.sh &
wal -Rst # Finish loading wal *before* starting dwm
exec ssh-agent dbus-launch --sh-syntax --exit-with-session dwm
