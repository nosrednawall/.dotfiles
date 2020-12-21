#!/bin/bash
sudo apt install mutt
mkdir -p ~/.mail/{inbox,sent,postponed}
mkdir -p ~/.mutt/{cache/{headers,bodies},certificates}
cp -r muttrc ~/.muttrc
