#!/bin/sh

# Check pacman updates

[ -f ~/tmp/checkupdates.current ] || cache-updates.sh
upgrades=$(wc -l ~/tmp/checkupdates.current | cut -d' ' -f1)
printf "%s" "$upgrades"
