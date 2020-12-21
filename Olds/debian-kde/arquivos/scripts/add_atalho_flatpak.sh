#!/bin/bash

function add_atalho(){
	NOME_PROGRAMA_FLATPAK = $1;
	NOME_PROGRAMA = $2;
	cat >'/usr/share/applications/$NOME_PROGRAMA.desktop' <<EOF
		[Desktop Entry]\n
		Name=$NOME_PROGRAMA  #Nome que aparece no menu\n
		Comment=  #Comentário que aparece ao deixar o mouse em cima\n
		Exec=flatpak run $NOME_PROGRAMA_FLATPAK #Local da aplicação\n
		Type=Application  #Tipo do Lançador\n
		Icon=  #Imagem que irá representar como ícone\n
		MimeType=application;  #Sistema de identificadores padronizados para criar os separadores no menu\n
		Categories=  #Categoria\n
		EOF
}

if [ $# -lt 1 ];then
   echo "Faltou informar o nome do programa do flatpak"
   echo "ex Steam: $ sh add_atalho_flatpak.sh -n com.valvesoftware.Steam Steam"
   echo "O programa precisa do sudo ou das permissões do"
   exit 1
fi

case $* in
    *)
        add_atalho $1 $2
        break
        ;;
esac    
