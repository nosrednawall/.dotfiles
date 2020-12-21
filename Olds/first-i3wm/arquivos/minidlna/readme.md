# Instalando o minidlna
Execute o script install_minidlna.sh
```sh
chmod +x install_minidlna.sh
./install_minidlna.sh
```
Ele irá instalar o minidlna para sistemas baseados em debian, copiar o arquivo
de configuração que está nessa pasta, e criará as
pastas:
* /var/lib/minidlna/videos
* /var/lib/minidlna/musicas

Após isso faça o link simbólico das suas bibliotecas de músicas e vídeos para
essas duas pastas, ex:

* /home/$USER/Vídeos
```sh
sudo ln -s /home/$USER/Vídeos /var/lib/minidlna/videos/videos_user
sudo ln -s /home/$USER/Downloads /var/lib/minidlna/videos/Downloads
```
* /home/$USER/Músicas
```sh
sudo ln -s /home/$USER/Músicas /var/lib/minidlna/musicas/musicas_user
sudo ln -s /home/$USER/Downloads /var/lib/minidlna/musicas/Downloads
```
Feito isso reinicie o serviço do minidlna
```sh
sudo systemctl stop minidlna.service
sudo systemctl start minidlna.service
```
Obs.: É possível testar com o VLC se o serviço está funcionando.
