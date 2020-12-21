# Instalando theme Dracula

```sh
sudo xbps-install unzip
wget https://github.com/dracula/gtk/archive/master.zip
mkdir -p ~/.themes
unzip master.zip -d ~/.themes/Dracula
cp -r gtk-3.0/ ~/.config

gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
```
Credits
[Dracula](https://draculatheme.com/gtk)
