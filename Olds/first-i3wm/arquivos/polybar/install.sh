git clone https://github.com/terroo/fonts
sudo cp -r fonts/fonts/* /usr/share/fonts
fc-cache -fv
git clone https://github.com/adi1090x/polybar-themes
cd polybar-themes/polybar-4/ 
cp * ~/.config/polybar/