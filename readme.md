## My arch setup

Steps:

1. Install git and clone repo
2. Run the script as root
3. Run in nvim :PlugInstall
4. Configure locales
5. Configure hardware (touchpad, sound, wireless, etc)
6. Configure dwm hotkeys (brightness, volume, scrot)

---

### The script will:
* install system stuff

```
xorg libx11-dev libxft-dev libxinerama-dev ttf-ubuntu-font-family
```

* install apps

```
ranger htop curl scrot atool unzip python3-pip clang neovim
mupdf mplayer qutebrowser
```

* check repository files

```
dwm/ st/ dmenu/ .xinitrc .bashrc nvim/
```

* move everything to appropriate directory

```
dwm st dmenu to ~/apps
bashrc xinitrc to ~/
nvim to ~/.config/
```

* execute commands

```
ranger --copy-config=all
make clean install for apps
mkdir ~/.local/share/nvim/plugs
run curl script to install vim-plug
```

* pip install

```
jedi neovim flake8
```
