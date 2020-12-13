# Wallpapers para dia e noite

Esse script verifica se é dia ou noite e aplica um wallpaper conforme especificado.

obs.: Foi configurado como dia o período entre 06h00 até 18h00

### Requesitos:
* Vários wallpapers dentro da pasta */home/$USER/.wallpapers/*
* feh 
```sh 
sudo apt install feh # Debian
sudo xbps-install feh # Void
 ```

### Instalando
Após baixar os requisitos execute:
```sh
chmod +x random-wallpaper.sh && ./random-wallpaper.sh
```
Caso utilizar o I3 adicione a linha abaixo dentro do seu conf
```sh
exec --no-startup-id path-do-seu-script/random-wallpaper.sh
# No meu caso ficou assim

```