#!/bin/sh

# fazer a atualizacao do arquivo profile quando o note é ligado
source ~/.profile
redshift -l -25.53:-49.2 -t 6000:3600  &
