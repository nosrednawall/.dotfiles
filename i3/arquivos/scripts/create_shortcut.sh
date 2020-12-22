#!/bin/bash

# Valida se tem os arqumentos necessários para o script funcionar
if test $* -z;
  then
    cat <<< '
      usage: up [--level <n>| -n <levels>][--help][--version]

      Report bugs to: 
      up home page:
'
  exit 0
fi

NAME=$1 
COMMENT=$5
GENERICNAME=$2
EXECPATH=$3
ICONPATH=$4

cat <<< '
[Desktop Entry]
Name='${NAME}'
Comment='${COMMENT}'
GenericName='${GENERICNAME}'
Exec='${EXECPATH}'
Icon='${ICONPATH}'
Type=Application
StartupNotify=false
StartupWMClass='${NAME}'
Categories=Application;
MimeType=text/plain;inode/directory;
Actions=new-empty-window;
Keywords='${NAME}';

[Desktop Action new-empty-window]
Name=New Empty Window
Exec='${EXECPATH}'
Icon='${ICONPATH}'
' > '/usr/share/applications/'${NAME}'.desktop'
