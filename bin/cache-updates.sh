#!/bin/sh

checkupdates > /home/dther/tmp/checkupdates.current
count=$(wc -l /home/dther/tmp/checkupdates.current | cut -d' ' -f1)
[ $count -eq 0 ] || notify-send "Updates Available:" $count
