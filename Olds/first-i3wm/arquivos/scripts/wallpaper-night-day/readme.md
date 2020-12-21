# Wallpapers para dia e noite

Esse script verifica se é dia ou noite e aplica um wallpaper conforme especificado.

obs.: Foi configurado como dia o período entre 06h00 até 18h00

### Requesitos:
* 2 Wallpapers, 1 com o nome *day.jpg* e o outro com o nome *night.jpg*, dentro da pasta desse projeto.
* cron ```sudo apt install cron ```
* feh ``` sudo apt install feh ```

### Wallpaper dia de referência
![Wallpaper dia](https://wallpaperplay.com/walls/full/2/4/8/16949.jpg)

### Wallpaper noite de referência
![Wallpaper noite](https://i.redd.it/a0ez44uhhx911.jpg)

### Instalando
Após baixar os requisitos execute o script ```install.sh```
```sh
chmod +x install.sh && sudo sh install.sh
```
Caso utilizar o I3 adicione a linha abaixo dentro do seu conf
```sh
exec --no-startup-id /usr/local/scripts/wallpaper-switcher
```
Ou adicione o caminho do script dentro do inicializar do seu DE