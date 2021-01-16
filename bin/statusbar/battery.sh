#!/bin/sh

# Battery gauge module for status bar
# Checks the battery levels (via /sys/class/power_supply/BAT*)
# and selects an appropriate icon to represent current power.

for battery in /sys/class/power_supply/BAT?
do
    capacity=$(cat "$battery"/capacity) || break
    status=$(sed "s/Not charging//;\
        s/Charging//;\
        s/Unknown//;\
        s/Full//" "$battery"/status)

    if [ "$status" = "Discharging" ]
    then
        if [ "$capacity" -lt 25 ]
        then
            # DANGEROUSLY LOW
            status=''
            notify-send "BATTERY LOW" "Get a charge, kid!!!" -u critical
        elif [ "$capacity" -lt 55 ]
        then
            # low
            status=''
        elif [ "$capacity" -lt 75 ]
        then
            # medium
            status=''
        else
            # high
            status=''
        fi
    fi
    if [ "$capacity" -gt 100 ]
    then
        capacity=100
    fi
    printf "%s%s%%" "$status" "$capacity"
done
