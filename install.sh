#!/usr/bin/env bash
cdir=$(pwd)
hdir=/home/$1
echo "Updating packages"
pacman -Syu --noconfirm &> /dev/null
echo "Installing packages (this may take a while)"
pacman -S --noconfirm xorg-server xorg-xinit xorg-xsetroot bash-completion gcc make pkg-config libx11 libxft libxinerama ttf-ubuntu-font-family ranger htop scrot atool unzip python-pip clang neovim mupdf mplayer qutebrowser &> /dev/null
echo "Installing pip packages for neovim plugins"
pip install --upgrade -qqq jedi neovim flake8
echo "Moving and installing suckless apps"
cp -Rf $cdir/apps/       $hdir/apps
cd $hdir/apps/dwm-6.1/   && make clean install &> /dev/null
cd $hdir/apps/dmenu-4.7/ && make clean install &> /dev/null
cd $hdir/apps/st-0.7/    && make clean install &> /dev/null
echo "Placing .bashrc and .xinitrc in ~/"
cd $cdir
cp -f bashrc  $hdir/.bashrc
cp -f xinitrc $hdir/.xinitrc
echo "Placing configs for both root and user in a proper location"
curl -fLo $hdir/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null
mkdir -p $hdir/.config/{qutebrowser,ranger,nvim}
mkdir -p /root/.config/{ranger,nvim}
cp -Rf config/qutebrowser/* $hdir/.config/qutebrowser/
cp -Rf config/ranger/*      $hdir/.config/ranger/
cp -Rf config/nvim/*        $hdir/.config/nvim/
cp -Rf config/ranger/*      /root/.config/ranger/
cp -Rf config/rootnvim/*    /root/.config/nvim/
mkdir $hdir/downloads
echo "Changing the owner (recursively) of the home directory"
chown -R $1 $hdir
echo "Everything is done, now run in nvim :PlugInstall"
