#! /bin/bash


# checa se existem dois monitores definidos
MON=$(xrandr --listmonitors | grep Monitors | cut -b 11-)

# caso tenha, executa o setup para dois
if [[ $MON == 2 ]] ; then
        xrandr --output VGA-1 --mode 1600x900 --pos 0x180 --rotate normal --output DVI-D-1 --off --output HDMI-1 --mode 2560x1080 --pos 1600x0 --rotate normal
fi

feh --bg-fill --randomize -r /home/$USER/.dotfiles/wallpapers/*

