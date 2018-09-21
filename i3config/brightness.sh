#!/bin/bash


# Brightness script for i3

# How long to display the message (in milliseconds)
delay=250

if   [ "$1" = "up" ]; then
    if [[ $(~/.config/i3/truncate.exe $(light)) -lt "5" ]]; then
        light -A 1
    else
        light -A 5
    fi
elif [ "$1" = "down" ]; then
    if [[ $(~/.config/i3/truncate.exe $(light)) -le "5" ]]; then
        light -U 1
    else
        light -U 5
    fi
else 
    echo "$1 is an unknown parameter. Either \"up\" or \"down\""
fi

notify-send -t $delay "brightness: <b>$(light)</b>"
