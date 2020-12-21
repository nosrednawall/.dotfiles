#!/bin/sh

# /////////////////////////////////////////////////////////////////
#
# awesome-linux-installer.sh
#  A shell script that installs the awesome fonts from repository
#  releases by release version number
#
#  Copyright 2018 Christopher Simpkins
#  MIT License
#
#  Usage: ./awesome-linux-installer.sh [VERSION]
#         Format the version number as vX.XXX
#
# /////////////////////////////////////////////////////////////////

AWESOME_INSTALL_PATH="$HOME/.local/share/fonts"

if [ $# -ne 1 ]; then
    echo "Please include a version number argument formatted as vX.XXX"
    exit 1
fi

if [ "$1" = "--help" ]; then
    echo "Usage: ./awesome-linux-installer [VERSION]"
    echo "Format [VERSION] as X.X.X for the desired release version of the fonts."
    exit 0
fi

if [ ! -d "$AWESOME_INSTALL_PATH" ]; then
    echo "Unable to detect the install directory path '$AWESOME_INSTALL_PATH'.  Please create this path and execute the script again."
    exit 1
fi

AWESOME_VERSION="$1"
AWESOME_DL_URL="https://use.fontawesome.com/releases/v$AWESOME_VERSION/fontawesome-free-$AWESOME_VERSION-desktop.zip"

AWESOME_ARCHIVE_PATH="fontawesome-free-$AWESOME_VERSION-desktop.zip"

# pull user requested fonts from the AWESOME repository releases & unpack
echo " "
echo "Pulling awesome $AWESOME_VERSION fonts from the Github repository release..."
curl -L -O "$AWESOME_DL_URL"

echo " "
echo "Unpacking the font files..."
if [ -f "$AWESOME_ARCHIVE_PATH" ]; then
    unzip "$AWESOME_ARCHIVE_PATH"
else
    echo "Unable to find the pulled archive file.  Install failed."
    exit 1
fi

# install
if [ -d "otfs" ]; then
    echo " "
    echo "Installing the AWESOME fonts..."
    # clean up archive file
    rm "$AWESOME_ARCHIVE_PATH"

    # move fonts to install directory
    echo "Installing AWESOME-Regular.otfs on path $AWESOME_INSTALL_PATH/Font Awesome 5 Free-Solid-900.otf"
    mv otfs/Font Awesome 5 Free-Solid-900.otf "$AWESOME_INSTALL_PATH/Font Awesome 5 Free-Solid-900.otf"

    echo "Installing Font Awesome 5 Free-Regular-400.otf on path $AWESOME_INSTALL_PATH/Font Awesome 5 Free-Regular-400.otf"
    mv otfs/Font Awesome 5 Free-Regular-400.otf "$AWESOME_INSTALL_PATH/Font Awesome 5 Free-Regular-400.otf"
    
    echo "Installing Font Awesome 5 Brands-Regular-400.otf on path $AWESOME_INSTALL_PATH/Font Awesome 5 Brands-Regular-400.otf"
    mv otfs/Font Awesome 5 Brands-Regular-400.otf "$AWESOME_INSTALL_PATH/Font Awesome 5 Brands-Regular-400.otf"

    echo " "
    echo "Cleaning up..."
    rm -rf ttf

    # clear and regenerate font cache
    echo " "
    echo "Clearing and regenerating the font cache.  You will see a stream of text as this occurs..."
    echo " "
    fc-cache -f -v

    echo " "
    echo "Testing. You should see the expected install filepaths in the output below..."
    fc-list | grep "awesome"

    echo " "
    echo "Install of awesome $AWESOME_VERSION complete."
    exit 0
else
    echo "Unable to identify the unpacked font directory. Install failed."
    exit 1
fi