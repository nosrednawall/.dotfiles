#!/usr/bin/env bash

# Terminate already running bar instances
pkill -c polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar top_principal &
polybar top_secundario &

echo "Bars launched..."

