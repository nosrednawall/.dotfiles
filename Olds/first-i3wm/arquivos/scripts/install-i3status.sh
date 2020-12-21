#!/bin/bash
mkdir -p /home/$USER/git ; cd /home/$USER/git
git clone https://github.com/i3/i3status.git ; cd i3status
sudo apt-get install libconfuse-dev libyajl-dev libasound2-dev libiw-dev asciidoc libpulse-dev libnl-genl-3-dev dh-autoreconf
autoreconf -fi
mkdir build
cd build
../configure
make -j8
sudo make install
