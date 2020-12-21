#!/bin/bash
cmus-remote -C clear
cmus-remote -C "add ~/Musics"
#cmus-remote -C "add /media/hd-externo/StreamingMiniDLNA/Musicas/"
cmus-remote -C "update-cache -f"
