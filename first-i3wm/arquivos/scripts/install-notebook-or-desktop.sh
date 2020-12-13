#!/bin/bash

# excluo os arquivos que serão copiados
rm -r /home/$USER/.config/i3/i3status.conf

# interacao com o usuoario
echo "Informe \"n\" para notebook ou \"d\" para desktop";
read ESCOLHA;

# efetua a ações diferentes dependendo da escolha do usuário
case $ESCOLHA in
    n)
        echo "Selecionado as configurações para notebook"
        sudo cp -r /home/$USER/.dotfiles-i3wm/arquivos/xorg.conf /etc/X11/xorg.conf;
        #ln -s /home/$USER/.dotfiles-i3wm/arquivos/i3/i3status-notebook.conf /home/$USER/.config/i3/i3status.conf
    ;;
    d)
        echo "Selecionado as configurações para desktop desktop";
        #ln -s /home/$USER/.dotfiles-i3wm/arquivos/i3/i3status-desktop.conf  /home/$USER/.config/i3/i3status.conf
    ;;
    *)
        echo "nenhuma das opções foi escolhida, logo você ficou sem copiar alguns arquivos nai wa! 😓";
    ;;
esac
echo "Finalizado :D"    
