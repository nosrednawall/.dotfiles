#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/forest"

# Terminate already running bar instances
pkill -x polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
# polybar -q main -c "$DIR"/config.ini
polybar -q bar_bottom -c "$DIR"/bar_bottom.ini &
polybar -q bar_top -c "$DIR"/bar_top.ini &
