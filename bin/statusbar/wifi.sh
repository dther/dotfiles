#!/bin/sh

# Wifi module
# Checks current wifi board status and prints
# the quality + appropriate siji icon

case "$(cat /sys/class/net/w*/operstate 2> /dev/null)" in
    down) quality='' ;;
    up) quality="$(awk '/^\s*w/ { printf "%i", ($3 * 100 / 70) }'\
        /proc/net/wireless)" 
    if [ "$quality" -lt 33 ]
    then
        # low strength
        quality=''$quality'%'
    elif [ "$quality" -lt 66 ]
    then
        # med strength
        quality=''$quality'%'
    elif [ "$quality" -lt 101 ]
    then
        # high strength
        quality=''$quality'%'
    fi ;;
esac
printf "%s" "$quality"

