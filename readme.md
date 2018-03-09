# Switching to arch linux

- install git and clone repo
- run the script as root

* install system stuff
> xorg libx11-dev libxft-dev libxinerama-dev ttf-ubuntu-font-family
* install apps
> ranger htop curl scrot atool unzip python3-pip clang neovim
> mupdf mplayer qutebrowser
* check repository files
> dwm/ st/ dmenu/ .xinitrc .bashrc nvim/
* move everything to appropriate directory
> dwm st dmenu to ~/apps
> bashrc xinitrc to ~/
> nvim to ~/.config/
* execute commands
> ranger --copy-config=all
> make clean install for apps
> mkdir ~/.local/share/nvim/plugs
> run curl script to install vim-plug
* pip install
> jedi neovim flake8

- run in nvim :PlugInstall
- configure locales
- configure hardware (touchpad, sound, wireless, etc)
- configure dwm hotkeys (brightness, volume, scrot)
