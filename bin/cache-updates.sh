#!/bin/sh

# Check if connected to the internet
ping -c 1 example.org || exit 1
checkupdates > /home/dther/tmp/checkupdates.current
count=$(wc -l /home/dther/tmp/checkupdates.current | cut -d' ' -f1)
pkill -SIGRTMIN+1 dwmblocks
[ "$count" -eq 0 ] || notify-send "Updates Available:" "$count"
