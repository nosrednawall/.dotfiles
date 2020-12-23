#!/bin/sh

#set -e

######################
# Inicializar de programas junto ao I3
#####################

# variaveis
VOID='NAME="void"';
OS="$(cat /etc/os-release | grep '^NAME=')";

# verifica se é o notebook ou o desktop
case "$OS" in
  "$VOID")
	pasystray &
  	xfce4-power-manager &
	nm-applet &
  ;;
  *)
    # caso nao seja, é o desktop
  	copyq &
  ;;

esac
###############################################################
# Demais programas que são os mesmos para os dois equipamentos
##############################################################

# bar
sh ~/.config/polybar/launch.sh &

# aplicar transparencia
pkill -x picom
picom --config ~/.config/picom/picomrc &

# ativar numlock
numlockx on

# sistema de mensagens
pkill -x dunst
dunst -conf ~/.config/dunst/dunstrc &

# servidor de musica
pkill -x mpd
mpd &

# Bloqueio da àrea de trabalho 
pkill -x xautolock
xautolock -time 10 -locker v3lock &

# Wallpapers
feh --bg-fill --randomize -r ~/.wallpapers/* &
