#!/bin/sh

echo -e "normal\nflip\nleft\nright" | dmenu -l 10 -c -p "Rotate Screen:" | xargs thinkpad-rotate --force-direction
