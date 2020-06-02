#!/bin/bash

#get colors
. ~/.cache/wal/colors.sh

# color scheme
nb=$color0
nf=$color2
sb=$color2
sf=$color15
fn='xos4 Terminus:pixelsize=30'

printf "normal\\nflip\\nleft\\nright" | 
    dmenu -sf "$sf" -sb "$sb" -nf "$nf" -nb "$nb" -fn "$fn" -l 10 -c -p "Rotate Screen:" | 
    xargs thinkpad-rotate --force-direction
