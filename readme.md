## My dotfiles and configs

Steps:

1. Install git and clone repo
1. Run the install.sh as root (sudo) and pass it your username
1. Run the curl.sh (now you can startx)
1. Run in nvim :PlugInstall
1. Configure locales
1. Configure git not to ask pwd everytime
1. Configure hardware (touchpad, sound, wireless, etc)
1. Configure dwm hotkeys (brightness, volume, scrot)

---

### What does the script

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
nvim qutebrowser ranger to ~/.config/
```
* execute commands
```
make clean install for apps
```
* pip install
```
jedi neovim flake8
```
