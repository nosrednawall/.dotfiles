# Pós instalação Debian Minimal

```sh
su -

# Atualizar sistema
apt update

# Verificar drive de vídeo da placa
lspci -nn |grep VGA

# Após verifica instalar os pacotes conforme a wiki Debian
apt install xserver-xorg-video-amdgpu
apt install firmware-amd-graphics
apt install firmware-linux-nonfree libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers

# Instalar versão mínima KDE
apt install kde-plasma-desktop

# Instalar diversos pacotes restantes
apt install firefox-esr
apt install vim
apt install git # dentro do usuario execute isso git config --global user.mail "yourEmail.com" ; git config --global user.name "MyNameIs"
```

# Pacotes Opcionais
```sh
apt install minidlna
apt install screenfetch

# Alguns pacotes do KDE
apt install kate
apt install ark 

# Players
apt install vlc

# Extracao 
apt install arc arj cabextract lhasa p7zip p7zip-full p7zip-rar rar unrar unace unzip xz-utils zip
```

# Dev Debian
```sh
apt-get install -y build-essential
```

# Java DEV
```sh
apt install java-package
apt install default-jdk
```

# Python DEV
```sh
apt-get install python3
sudo apt-get install python3-pip
```

# JS Node Dev
```sh
# Using Debian, as root
curl -sL https://deb.nodesource.com/setup_lts.x | bash -
apt-get install -y nodejs
```
