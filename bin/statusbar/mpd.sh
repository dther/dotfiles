#!/bin/sh

# mpd module, prints mpd track status

mpc | awk 'NR == 1 { song = $0 }
    NR == 2 { status = $1 }
    END {
        if (status) {
            status = (status == "[playing]")?"":"";
            printf "%s%s", status, song; }
        else print "No Track"}'
