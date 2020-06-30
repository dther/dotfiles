#!/bin/sh

battery() {
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
}

wifi() {
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
}

volume() {
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
}

datetime() {
    date +"%a %x %I:%M%p"
}

memory() {
    free | awk '($1 == "Mem:"){printf "%.1f%", $7/$2*100}'
}

mpd() {
    mpc | awk 'NR == 1 { song = $0 }
        NR == 2 { status = $1 }
        END {
            if (status) {
                status = (status == "[playing]")?"":"";
                printf "%s%s", status, song; }
            else print "No Track"}'
}

packages() {
    [ -f ~/tmp/checkupdates.current ] || cache-updates.sh
    upgrades=$(wc -l ~/tmp/checkupdates.current | cut -d' ' -f1)
    printf "%s" "$upgrades"
}

email() {
	unread="$(find "${XDG_DATA_HOME:-$HOME/.local/share}"/mail/*/[Ii][Nn][Bb][Oo][Xx]/new/* -type f | wc -l 2>/dev/null)"
	pidof mbsync >/dev/null 2>&1 && sync=""
	[ "$unread" = "0" ] && printf "%s" "$sync" || printf "%s%s" "$unread" "$sync"
}

while true
do
	xsetroot -name "$(packages) $(wifi) $(battery) $(datetime);$(volume) $(memory) $(email) $(mpd)"
    sleep 1s
done
