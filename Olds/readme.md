## instalar temas para o bash
#### Pré-requisitos
```sh
sudo apt install wget vim
```
#### Instalação do Oh My Bash
```sh
sh -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
```
#### Utilização
* Listar temas
```sh
ls .oh-my-bash/themes/
```
* Alterar um tema
```sh
vi ~/.bashrc
```
Altere o nome do tema que preferir e depois apenas rode um source ~/.bashrc
para mostrar as alterações.
