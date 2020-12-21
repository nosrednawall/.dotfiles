# Dotfiles

#### Install Debian Minimal

Xorg and drivers
```sh
su -
apt install xserver-xorg-video-amdgpu firmware-amd-graphics firmware-linux-nonfree mesa-vulkan-drivers #para amdgpu
apt install vim xorg-minimal alsa-utils unzip hsetroot font-hack-ttf xrdb ntfs-3g xdg-utils
apt install bspwm sxhkd vim alsa-utils desktop-base xserver-xorg-input-all xserver-xorg-input-evdev xserver-xorg-input-kbd xserver-xorg-input-mouse xserver-xorg-input-synaptics xserver-xorg-input-joystick xserver-xorg-input-libinput xorg-xinit xdm xserver-xorg xorg-docs xorg-docs-core xorg-xsetroot
```
BSPWM e afins

```sh
apt install bspwm sxhkd vim dmenu rxvt-unicode rofi ranger xset sudo git playerctl xautolock i3lock copyq
```

Compilando polybar
```sh

apt install gcc
apt install cmake gcc clang
apt install xcb-xkb
apt install libcurl
apt install libpulse
apt install ccache
apt install build-essential
apt install libxcb-composite0-dev
apt install xinit
apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev git g++ libxcb-composite0-dev pulseaudio lm-sensors ttf-unifont unifont
```


demais programas:

```sh
apit install thunar firefox-esr
apt install arc arj cabextract lhasa p7zip p7zip-full p7zip-rar rar unrar unace unzip xz-utils zip
apt install fonts-hack
apt install colorer
apt install ttf-ubuntu-font-family
apt install htop
apt install mpd
apt install mpv
apt install lxappearance
apt install pavucontrol
```

git clone git@github.com:nosrednawall/.dotfiles.git .dotfiles ; cd .dotfiles
ln -s ~/.dotfiles/debian-bspwm/install.conf.yaml ~/.dotfiles/install.conf.yaml
./install

