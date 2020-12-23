#! /bin/bash

wget http://www.musicpd.org/download/mpd/0.22/mpd-0.22.3.tar.xz

tar xf mpd-0.22.3.tar.xz

cd mpd-0.22.3

sudo apt install meson g++ \
  libpcre3-dev \
  libmad0-dev libmpg123-dev libid3tag0-dev \
  libflac-dev libvorbis-dev libopus-dev libogg-dev \
  libadplug-dev libaudiofile-dev libsndfile1-dev libfaad-dev \
  libfluidsynth-dev libgme-dev libmikmod-dev libmodplug-dev \
  libmpcdec-dev libwavpack-dev libwildmidi-dev \
  libsidplay2-dev libsidutils-dev libresid-builder-dev \
  libavcodec-dev libavformat-dev \
  libmp3lame-dev libtwolame-dev libshine-dev \
  libsamplerate0-dev libsoxr-dev \
  libbz2-dev libcdio-paranoia-dev libiso9660-dev libmms-dev \
  libzzip-dev \
  libcurl4-gnutls-dev libyajl-dev libexpat-dev \
  libasound2-dev libao-dev libjack-jackd2-dev libopenal-dev \
  libpulse-dev libshout3-dev \
  libsndio-dev \
  libmpdclient-dev \
  libnfs-dev \
  libupnp-dev \
  libavahi-client-dev \
  libsqlite3-dev \
  libsystemd-dev \
  libgtest-dev \
  libboost-dev \
  libicu-dev \
  libchromaprint-dev \
  libgcrypt20-dev timidity timidity-daemon

meson . output/release --buildtype=debugoptimized -Db_ndebug=true
ninja -C output/release
sudo ninja -C output/release install

mkdir -p ~/.config/mpd/playlists
cd ~/.config/mpd
touch database mpd.fifo mpd.log mpd.pid mpdstate socket
ln -s /home/anderson/.dotfiles/debian-bspwd/arquivos/mpd/config /home/anderson/.config/mpd/config
mkdir -p ~/.ncmpcpp
ln -s  /home/anderson/.dotfiles/debian-bspwd/arquivos/mpd/ncmpcpp /home/anderson/.ncmpcpp/config
