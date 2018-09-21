#!/bin/bash

dir="/home/adris/Pictures/Wallpapers"
wallpaper=$(shuf -n1 -e $dir/*)
echo "Selected wallpaper $wallpaper"
feh --bg-fill $wallpaper
