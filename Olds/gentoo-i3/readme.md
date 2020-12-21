# Meus dotfiles para utilizar o i3wm 
Obs.: É necessário verificar o nome de todos os programas abaixo no site [https://packages.gentoo.org/](https://packages.gentoo.org/)

## Pós instalação Gentoo Linux
Nessa etapa você vai precisar instalar os seus drivers, o X, e configurar o seu usuário, caso precise de um tutorial é [esse](https://www.vivaolinux.com.br/artigo/Instalando-o-Gentoo-2018?pagina=4)

#### Display Manager
Slim
```sh
su
emerge -av -S slim
ln -s /etc/sv/dbus /var/service/dbus
ln -s /etc/sv/slim /var/service/slim
```
### Instalar os programas antes de executar o script dos dotfiles, ele são:

I3
```sh
sudo emerge -av -S i3-gaps dunst feh pasystray picom scrot NetworkManager network-manager-applet ImageMagick polybar font-unifont-bdf font-Siji font-weather-icons alsa-utils dunst 
```

Lockscreen, power manager, drivers
```sh
sudo emerge -av betterlockscreen xautolock xfce4-power-manager AlsaMixer.app 
```

Config themes gtk and qt
```sh
sudo emerge -av lxappearance qt5ct breeze-cursors compton-conf papirus-folders papirus-icon-theme  
```

For qt aplications on gtk add line on /etc/environment
```sh
QT_QPA_PLATFORMTHEME=gtk2
```

Players
```sh
sudo emerge -av mpv mpd ncmpcpp playerctl
```
### Programas complementares
```sh
sudo emerge -av thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman gvfs gvfs-cdda gvfs-mtp gvfs-smb gvfs-gphoto2 udiskie udisks2 tumbler qbittorrent cabextract p7zip p7zip-urar unrar unzip zip dialog gtkdialog libreoffice libreoffice-i18n-pt-BR xarchiver detox geany xfce4-clipman-plugin xfce4-screenshooter
```

Pass and QtPass
```sh
sudo emerge -av pass qtpass gpg2 xclip pinentry pinentry-gtk pinentry-tty
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
sudo emerge -av -S sct cronie
crontab -e
```

em seguida cole as linhas abaixo no final do arquivo:
```sh
0 21 * * * /usr/bin/sct 4500
0 6 * * * /usr/bin/sct 
```
Créditos: [https://www.vivaolinux.com.br/dica/Como-suprimir-a-emissao-de-luz-azul-da-tela-via-linha-de-comando](https://www.vivaolinux.com.br/dica/Como-suprimir-a-emissao-de-luz-azul-da-tela-via-linha-de-comando)
pronto)
[https://www.vivaolinux.com.br/artigo/Instalando-o-Gentoo-2018?pagina=1](https://www.vivaolinux.com.br/artigo/Instalando-o-Gentoo-2018?pagina=1)