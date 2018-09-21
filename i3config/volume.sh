#!/bin/bash

# Volume script for i3

volume=$(awk '/%/ {gsub(/[\[\]%]/,""); print $4}' <(amixer sget Master))

muted=$(awk '/%/ {gsub(/[\[\]]/,""); print $6}' <(amixer sget Master))

# How long to display the message (in milliseconds)
delay=250

# Meh icon thing
speaker="&lt;"
speakerbubble="|"
speakerempty=" "
speakerend="]"
speakeron="0["
speakermute="$speaker""x"

# How many speaker bubbles to display
numbubbles="34"
thingcount=$(( ($numbubbles + 1) * ($volume) / 100))

speaker=$speaker$speakeron
for ((i=0;i<$numbubbles;i++)) do
    if [ "$i" -le "$thingcount" ]; then
        speaker=$speaker$speakerbubble
    else
        speaker=$speaker$speakerempty
    fi
done
speaker=$speaker$speakerend



if   [ "$1" = "up" ]; then
    amixer -q set Master 2dB+ unmute
    notify-send -t $delay "<b>$volume%</b> $speaker" 
elif [ "$1" = "down" ]; then
    amixer -q set Master 2dB- unmute
    notify-send -t $delay "<b>$volume%</b> $speaker" 
elif [ "$1" = "mute" ];  then
    #amixer -q set Master toggle
    amixer -D pulse set Master 1+ toggle
    if [ "$muted" = "on" ]; then
        notify-send -t $delay "<b>Muted</b> $speakermute"
    else
        notify-send -t $delay "Unmuted: <b>$volume%</b> $speaker "
    fi
else
    echo "$1 is an unknown parameter. Either \"up\" or \"down\""
fi

