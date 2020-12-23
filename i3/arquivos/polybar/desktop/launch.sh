#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
pkill -c polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MON=$(xrandr --listmonitors | grep Monitors | cut -b 11-)

# caso tenha, executa o setup para dois
#if [[ $MON == 2 ]] ; then
	polybar -c ~/.config/polybar/config.ini main_desktop &
	polybar -c ~/.config/polybar/config.ini second_desktop &
#else
#	polybar -c ~/.config/polybar/config.ini main_notebook &
#fi




# Launch bar1 and bar2
#DISPLAY1="$(xrandr -q | grep 'eDP1' | cut -d ' ' -f1)"
#[ ! -z "$DISPLAY1" ] && MONITOR="$DISPLAY1" polybar main_notebook &

#DISPLAY2="$(xrandr -q | grep 'HDMI-1|VGA-1' | cut -d ' ' -f1)"
#[ ! -z $DISPLAY2 ] && MONITOR=$DISPLAY2 polybar -c ~/.config/polybar/config.ini main_desktop &
#[ ! -z $DISPLAY2 ] && MONITOR=$DISPLAY2 polybar -c ~/.config/polybar/config.ini second_desktop &


# Launch bar1 and bar2
#polybar -c ~/.config/polybar/config.ini main &
#polybar -c ~/.config/polybar/config.ini second &
