#!/bin/bash

i3status | while :
do
	#read line
        NOME_JANELA=$(xdotool getactivewindow getwindowname)
        echo "$NOME_JANELA" || exit 1
done