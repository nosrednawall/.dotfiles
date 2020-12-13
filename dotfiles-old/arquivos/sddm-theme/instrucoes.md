# Instruções

1. Descompactar
´´´sh

´´´

2. mover
´´´sh
sudo mv crown-blue /usr/share/sddm/themes
´´´

3. abrir o arquivo */etc/sddm.conf*
´´´sh
sudo nano /etc/sddm.conf 
´´´

4. alterar a área de themas

de
´´´sh
[Theme]
Current=maui
CursorTheme=breeze_cursors
´´´

para
´´´sh
[Theme]
Current=crown-blue
CursorTheme=breeze_cursors
´´´