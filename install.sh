#!/usr/bin/env bash

cdir=$(pwd)
hdir=/home/$1
bindir=$hdir/dotfiles-2/bin
fontdir=$hdir/dotfiles-2/misc/fonts

pkg_system="xorg-server xorg-xinit xorg-xsetroot bash-completion gcc make pkg-config libx11 libxft libxinerama patch python-pip python-pywal fakeroot"
pkg_essentials="openssh vsftpd wget git ps_mem ranger htop scrot w3m atool highlight zip unzip vim xclip mupdf mpv surf rxvt-unicode unrar feh"
pkg_gui_apps="filezilla gimp inkscape chromium firefox libreoffice-fresh"
pkg_fonts="noto-fonts-cjk adobe-source-han-serif-otc-fonts" # noto-fonts-cjk is enough
list_pkgs="$pkg_system $pkg_essentials"
# TODO: add pkg_fonts and pkg_gui_apps when testing is done

# https://wiki.archlinux.org/index.php/Fonts

echo "installing Iosevka fonts"
cd $fontdir # && wget https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-iosevka.tar.gz
#tar xzvf ttf-iosevka.tar.gz
#cd $fontdir/ttf-iosevka && makepkg -s
sudo pacman -U --noconfirm ttf-iosevka-2.0.1-1-any.pkg.tar.xz

echo "Updating packages"
pacman -Syu --noconfirm
echo "Installing packages (this may take a while)"
echo "System stuff: $pkg_system"
echo "Apps: $pkg_essentials $pkg_gui_apps"
pacman -S --noconfirm $list_pkgs

#echo "Installing st"
#git clone git://git.suckless.org/st $hdir/apps

echo "Moving and installing suckless apps"
cp -Rf $cdir/apps/       $hdir/apps
cd $hdir/apps/dwm-6.1/   && make clean install
cd $hdir/apps/dmenu-4.8/ && make clean install
cd $hdir/apps/st-0.8.1/  && make clean install


echo "Installing bin files"
#wget https://raw.githubusercontent.com/jschx/ufetch/master/ufetch-arch $hdir/uf
# chmod +x $bindir/uf
find $bindir/ -type f -exec chmod 755 {} \;
cp -rf $bindir/* /usr/local/bin/
# TODO: manage symlink with gnu stow


echo "installing xwinwrap"
cd $hdir && git clone https://github.com/ujjwal96/xwinwrap
cd xwinwrap
make && sudo make install
make clean

echo "copy dynamic wallpaper"
#cp $hdir/dotfiles-2/misc/pixels10.gif $hdir/.cache/wallpaper.gif
cp -rf $hdir/dotfiles-2/misc/gifs $hdir/.cache/gifs/
# put this in xinitrc (DONE!)
# xwinwrap -ov -ni -fs -- mpv -wid WID --keepaspect=no --loop ~/.cache/gifs/pixels10.gif

echo "Placing .bashrc and .xinitrc in ~/"
cd $cdir
cp -f misc/bashrc     $hdir/.bashrc
cp -f misc/xinitrc    $hdir/.xinitrc
cp -f misc/Xresources $hdir/.Xresources

echo "Placing configs for user in a proper location"
#curl -fLo $hdir/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $hdir/.config/{ranger} # removed qutebrowser, nvim
#cp -Rf config/qutebrowser/* $hdir/.config/qutebrowser/
cp -Rf config/ranger/*      $hdir/.config/ranger/
#cp -Rf config/nvim/*        $hdir/.config/nvim/
mkdir $hdir/{downloads,screens}

echo "Doing similar for root"
mkdir -p /root/.config/{ranger} # removed nvim
cp -Rf config/ranger/* /root/.config/ranger/
#cp -Rf config/rnvim/*  /root/.config/nvim/
cp -f  misc/rootrc     /root/.bashrc

echo "Making system to autologin $1 and auto startx"
mkdir -p /etc/systemd/system/getty@tty1.service.d
echo "[Service]" >> /etc/systemd/system/getty@tty1.service.d/override.conf
echo "    ExecStart=" >> /etc/systemd/system/getty@tty1.service.d/override.conf
echo "    ExecStart=-/sbin/agetty --autologin $1 --noclear %I \$TERM" >> /etc/systemd/system/getty@tty1.service.d/override.conf
cp -f misc/bashprofile $hdir/.bash_profile

#echo 'Creating symlink for nvim called vim'
#ln -sf /bin/nvim /usr/bin/vim

#echo 'Installing eslint'
#npm install -g eslint
#cp -Rf misc/eslintrc.json $hdir/.eslintrc.json

echo "Changing the owner (recursively) of the home directory"
chown -R $1 $hdir


echo "cleaning up installation files"
rm -rf $hdir/apps
rm -rf $hdir/xwinwrap

echo "Everything is done"
#echo "Now run in nvim :PlugInstall"
