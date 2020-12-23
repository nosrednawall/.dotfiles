#!/etc/bash

## Add this to your wm startup file.

# Terminate already running bar instances
#killall -q polybar
pkill -x polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# variaveis
VOID='NAME="void"';
OS="$(cat /etc/os-release | grep '^NAME=')";

# verifica se é o notebook ou o desktop
case "$OS" in
  "$VOID")
    # caso seja o note verifica se o mesmo está com dois monitores e aplica as
    # configuracoes de cada um
    DISPLAY1="$(xrandr -q | grep 'eDP1\|VGA-1' | cut -d ' ' -f1)"
    [ ! -z "$DISPLAY1" ] && MONITOR="$DISPLAY1" polybar -c ~/.config/polybar/notebook/config.ini top1 &
    [ ! -z "$DISPLAY1" ] && MONITOR="$DISPLAY1" polybar -c ~/.config/polybar/notebook/config.ini bottom1 &

    DISPLAY2="$(xrandr -q | grep 'HDMI1' | cut -d ' ' -f1)"
    [ ! -z "$DISPLAY2" ] && MONITOR="$DISPLAY2" polybar -c ~/.config/polybar/notebook/config.ini top2 &
    [ ! -z "$DISPLAY2" ] && MONITOR="$DISPLAY2" polybar -c ~/.config/polybar/notebook/config.ini bottom2 &
  ;;
  *)
    # caso nao seja é o desktop
    DISPLAY3="$(xrandr -q | grep 'HDMI-1' | cut -d ' ' -f1)"
    [ ! -z "$DISPLAY3" ] && MONITOR="$DISPLAY3" polybar -c ~/.config/polybar/desktop/config.ini main_desktop &

    DISPLAY4="$(xrandr -q | grep 'VGA-1' | cut -d ' ' -f1)"
    [ ! -z "$DISPLAY4" ] && MONITOR="$DISPLAY4" polybar -c ~/.config/polybar/desktop/config.ini second_desktop &
  ;;

esac
