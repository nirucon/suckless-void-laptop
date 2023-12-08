#!/bin/sh

# A dwm_bar function to show the master volume of PulseAudio
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: pamixer

dwm_pulse () {
    VOL=$(pamixer --get-volume)
    STATE=$(pamixer --get-mute)
    
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATE" = "true" ] || [ "$VOL" -eq 0 ]; then
            printf "v: "
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "v: %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "v: %s%%" "$VOL"
        else
            printf "v: %s%%" "$VOL"
        fi
    else
        if [ "$STATE" = "true" ] || [ "$VOL" -eq 0 ]; then
            printf "MUTE"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "v: %s%%" "$VOL"
        else
            printf "v: %s%%" "$VOL"
        fi
    fi
    printf "%s\n" "$SEP2"
}

dwm_pulse
