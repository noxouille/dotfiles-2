#!/usr/bin/env bash

cdir=$(pwd)
hdir=/home/$1

echo "Updating packages"
pacman -Syu --noconfirm >> $hdir/scriptlog.txt
echo "Installing packages (this may take a while)"
echo "System stuff: xorg-server xorg-xinit xorg-xsetroot bash-completion gcc make pkg-config libx11 libxft libxinerama ttf-ubuntu-font-family python-pip clang"
echo "Apps: ranger htop scrot w3m atool highlight unzip neovim xclip mupdf mplayer qutebrowser transmission-cli"
pacman -S --noconfirm xorg-server xorg-xinit xorg-xsetroot bash-completion gcc make pkg-config libx11 libxft libxinerama ttf-ubuntu-font-family ranger htop scrot w3m atool highlight unzip python-pip clang neovim xclip mupdf mplayer qutebrowser transmission-cli >> $hdir/scriptlog.txt

echo "Installing pip packages for neovim plugins"
pip install --upgrade jedi neovim flake8 >> $hdir/scriptlog.txt

echo "Moving and installing suckless apps"
cp -Rf $cdir/apps/       $hdir/apps
cd $hdir/apps/dwm-6.1/   && make clean install >> $hdir/scriptlog.txt
cd $hdir/apps/dmenu-4.8/ && make clean install >> $hdir/scriptlog.txt
cd $hdir/apps/st-0.8/    && make clean install >> $hdir/scriptlog.txt

echo "Placing .bashrc and .xinitrc in ~/"
cd $cdir
cp -f misc/bashrc  $hdir/.bashrc
cp -f misc/xinitrc $hdir/.xinitrc

echo "Placing configs for user in a proper location"
curl -fLo $hdir/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >> $hdir/scriptlog.txt
mkdir -p $hdir/.config/{qutebrowser,ranger,nvim}
cp -Rf config/qutebrowser/* $hdir/.config/qutebrowser/
cp -Rf config/ranger/*      $hdir/.config/ranger/
cp -Rf config/nvim/*        $hdir/.config/nvim/
mkdir $hdir/{downloads,screens}

echo "Doing similar for root"
mkdir -p /root/.config/{ranger,nvim}
cp -Rf config/ranger/* /root/.config/ranger/
cp -Rf config/rnvim/*  /root/.config/nvim/
cp -f  misc/rootrc     /root/.bashrc

echo "Making system to autologin $1 and auto startx"
mkdir -p /etc/systemd/system/getty@tty1.service.d
echo "[Service]" >> /etc/systemd/system/getty@tty1.service.d/override.conf
echo "    ExecStart=" >> /etc/systemd/system/getty@tty1.service.d/override.conf
echo "    ExecStart=-/sbin/agetty --autologin $1 --noclear %I \$TERM" >> /etc/systemd/system/getty@tty1.service.d/override.conf
cp -f misc/bashprofile $hdir/.bash_profile

echo 'Creating symlink for nvim called vim'
ln -sf /bin/nvim /bin/vim

echo "Changing the owner (recursively) of the home directory"
chown -R $1 $hdir

echo "Everything is done, check the ~/scriptlog.txt for errors"
echo "Now run in nvim :PlugInstall"
