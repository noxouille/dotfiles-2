## My dotfiles and script to autoinstall comfy dwm environment

![Screenshot of my setup](screenshot.jpg)

### Problems
* Bash prompt behaves strangely going up in history

### Steps (intended to use just after arch install):
1. Install git and clone repo
2. Run the install.sh as root (from dotfiles dir) and pass it your username
3. Start X (optional), run in nvim :PlugInstall

### Configure:
1. uncomment color in etc/pacman.conf
2. layouts
```
Move keyboard config file to /etc/X11/xorg.conf.d/00-keyboard.conf
```
3. hardware (touchpad, sound, wireless, etc)
```
For my lenovo g510                                                     
wifi       : needs broadcom-wl from aur (aurman for help)              
sound      : needs pulseaudio pamixer                                  
brightness : needs xorg-xbacklight and xf86-video-intel                
touchpad   : move config file to /etc/X11/xorg.conf.d/30-touchpad.conf 
```
4. dwm hotkeys
```
Uncomment needed lines in dwm's config.h
```
5. for git not to ask pwd everytime:
```
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
```
