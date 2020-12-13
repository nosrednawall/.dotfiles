#!/bin/bash

###########################################
#   Troca o wallpaper se for dia e ou noite
###########################################
while true; do
    if [ "$(date +%k)" -ge 6 -a "$(date +%k)" -le 18 ]  
    then
        feh --bg-fill -r /usr/share/wallpapers/wallpaper-night-day/day.jpg
    else feh --bg-fill -r /usr/share/wallpapers/wallpaper-night-day/night.jpg
    fi
done