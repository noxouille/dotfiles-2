## My dotfiles and configs

TODO: qb config

Steps:

1. Install git and clone repo

* install system stuff
```
xorg-server xorg-xinit xorg-xsetroot bash-completion
libx11 libxft libxinerama ttf-ubuntu-font-family
```
* install apps
```
ranger htop scrot atool unzip python-pip clang neovim
mupdf mplayer qutebrowser
```
* move everything to appropriate directory
```
dwm st dmenu to ~/apps
bashrc xinitrc to ~/
nvim qutebrowser to ~/.config/
```
* execute commands
```
ranger --copy-config=all
make clean install for apps
run curl script to install vim-plug
```
* pip install
```
jedi neovim flake8
```

2. Run in nvim :PlugInstall
3. Configure locales
4. Configure git not to ask pwd everytime
5. Configure hardware (touchpad, sound, wireless, etc)
6. Configure dwm hotkeys (brightness, volume, scrot)
