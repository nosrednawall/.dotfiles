
sudo apt install pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev libxcb-util0-dev
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
chmod +x build.sh
./build.sh
chmod +x install-i3lock-color.sh
./install-i3lock-color.sh
cd ..
sudo apt install feh imagemagic
git clone https://github.com/pavanjadhaw/betterlockscreen
cd betterlockscreen
cp betterlockscreen /home/$USER/.local/bin/
chmod +x /home/$USER/.local/bin/betterlockscreen