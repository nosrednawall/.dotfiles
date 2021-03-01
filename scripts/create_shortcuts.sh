#! /bin/bash
NAME=$1 
GENERICNAME=$2
EXECPATH=$3
ICONPATH=$4
COMMENT=$5

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
' > '/home/anderson/.local/share/applications/'${NAME}'.desktop'

#~/.local/share/applications/
#' > '/usr/share/applications/'${NAME}'.desktop'
