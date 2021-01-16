#!/bin/sh

# dwm status bar updater.
# Will probably be replaced with dwmblocks at some point, but here for now.

while true
do
	xsetroot -name "$(packages.sh) $(wifi.sh) $(battery.sh) $(datetime.sh);\
$(volume.sh) $(memory.sh) $(email.sh) $(mpd.sh)"
    sleep 1s
done
