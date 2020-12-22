# Meus dotfiles para o i3wm  - Kiss Keep It Simple Stupid

```sh
 ___  __    ___  ________   ________      
|\  \|\  \ |\  \|\   ____\ |\   ____\     
\ \  \/  /|\ \  \ \  \___|_\ \  \___|_    
 \ \   ___  \ \  \ \_____  \\ \_____  \   
  \ \  \\ \  \ \  \|____|\  \\|____|\  \  
   \ \__\\ \__\ \__\____\_\  \ ____\_\  \ 
    \|__| \|__|\|__|\_________\\_________\
                   \|_________\|_________| 
```

## Pós instalação Void Linux
```sh
su
xbps-install -Suv
find /usr/share/kbd/keymaps/ -type f
sed -i -e "s|#\?KEYMAP=.*|KEYMAP=br-abnt2|"  /etc/rc.conf
xbps-install -S elogind
ln -srf /etc/sv/{dbus,polkitd,elogind} /var/service
ln -s /etc/sv/dhcpcd /var/service/dhcpcd
useradd -m -s /bin/bash -U -G wheel,users,audio,video,cdrom,input voiduser
passwd voiduser
xbps-install -S xorg xterm
```

#### Display Manager
```sh
su
xbps-install -S slim
ln -s /etc/sv/dbus /var/service/dbus
ln -s /etc/sv/slim /var/service/slim
```
### Instalar os programas antes de executar o script dos dotfiles, ele são:

I3
```sh
sudo xbps-install -S i3-gaps dunst feh pasystray picom scrot NetworkManager network-manager-applet ImageMagick polybar font-unifont-bdf font-Siji font-weather-icons alsa-utils dunst 
```

Lockscreen, power manager, drivers
```sh
sudo xbps-install betterlockscreen xautolock xfce4-power-manager upower  AlsaMixer.app 
```

Config themes gtk and qt
```sh
sudo xbps-install lxappearance qt5ct breeze-cursors compton-conf papirus-folders papirus-icon-theme  
```
For qt aplications on gtk add line on /etc/environment
```sh
QT_QPA_PLATFORMTHEME=gtk2
```

Players
```sh
sudo xbps-install mpv mpd ncmpcpp playerctl
```
### Programas complementares
```sh
sudo xbps-install thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman gvfs gvfs-cdda gvfs-mtp gvfs-smb gvfs-gphoto2 udiskie udisks2 tumbler qbittorrent cabextract p7zip p7zip-urar unrar unzip zip dialog gtkdialog libreoffice libreoffice-i18n-pt-BR xarchiver detox geany xfce4-clipman-plugin xfce4-screenshooter
```
Pass and QtPass
```sh
sudo xbps-install pass qtpass gpg2 xclip pinentry pinentry-gtk pinentry-tty
# Caso o pinetry não funcione rode o comando abaixo após instalar os dotfiles
gpg-connect-agent reloadagent /bye
```
### Icones e themas
```sh
wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/materia-kde/master/install.sh 
```
### Criar as pastas padrão
```sh
mkdir -p ~/{Desktop,Documents,Downloads,Games,Videos,Musics/{animes,dramas,rock},Pictures/{abstratas,fotos,paisagens,wallpapers,ScreenShots},git,.programas,Podcasts}
```
### Timezone and Hardware clock on void
credits:https://docs.voidlinux.org/config/date-time.html
```sh
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
#add line below on /etc/rc.conf
HARDWARECLOCK=localtime
```
### Bonus:Como diminuir a luz azul do monitor

Prmeiro instale o sct e depois abra o arquivo do crontab:
```sh
sudo xbps-install -S sct cronie
crontab -e
```
em seguida cole as linhas abaixo no final do arquivo:
```sh
0 21 * * * /usr/bin/sct 4500
0 6 * * * /usr/bin/sct 
```
Créditos: [https://www.vivaolinux.com.br/dica/Como-suprimir-a-emissao-de-luz-azul-da-tela-via-linha-de-comando](https://www.vivaolinux.com.br/dica/Como-suprimir-a-emissao-de-luz-azul-da-tela-via-linha-de-comando)
pronto ;)
