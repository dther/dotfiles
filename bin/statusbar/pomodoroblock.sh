#!/bin/sh

# Pomodoro status module
# Tracks the file in $XDG_RUNTIME_DIR/termato.
# If the file doesn't exist... I'm not sure yet. I'd like it to be a counter
# of how many times it's completed today, but I'm not sure how that should
# be handled.
pomofile="$XDG_RUNTIME_DIR/termato"
printf ""
[ -f "$pomofile" ] && head -n1 "$pomofile" && exit
echo "break time"
