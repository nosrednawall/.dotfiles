#!/bin/bash

###########################################
#   Random wallpaper
###########################################
while true; do
    feh --bg-fill --randomize -r /home/$USER/.wallpapers/*
    sleep 600
done