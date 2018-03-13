#!/bin/bash
# Need to be ran as root
hdir=/home/$1
# installing packages
pacman -Syu --noconfirm
pacman -S --noconfirm xorg-server xorg-xinit xorg-xsetroot bash-completion libx11 libxft libxinerama ttf-ubuntu-font-family ranger htop scrot atool unzip python-pip clang neovim mupdf mplayer qutebrowser
# pip installing for nvim plugins
pip install --upgrade jedi neovim flake8
# placing everything properly
cp -R apps/ $hdir/apps
mkdir $hdir/.config/qutebrowser
mkdir $hdir/.config/ranger
mkdir $hdir/.config/nvim
mkdir $hdir/downloads
cp -R config/qutebrowser $hdir/.config
cp -R config/ranger $hdir/.config
cp -R config/nvim $hdir/.config
cp bashrc $hdir/.bashrc
cp xinitrc $hdir/.xinitrc
# installing suckless tools
cd $hdir/apps/dwm-6.1/ && make clean install
cd $hdir/apps/dmenu-4.7/ && make clean install
cd $hdir/apps/st-0.7/ && make clean install
chown -R $1 $hdir
# everything is done
echo "GREAT, ALL DONE"
echo "Now run the curl script and after that run in nvim :PlugInstall"
