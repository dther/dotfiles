#!/bin/sh

# Volume module

vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)
                               
if [ "$mute" = 'true' ]
then
    icon=''
elif [ "$vol" -lt 5 ]
then
    icon=''
elif [ "$vol" -lt 33 ]
then
    icon=''
elif [ "$vol" -lt 66 ]
then
    icon=''
elif [ "$vol" -lt 101 ]
then
    icon=''
else
    icon=''
fi
                               
printf "%s%s%%" "$icon" "$vol"
