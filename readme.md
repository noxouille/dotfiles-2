## My dotfiles and script to autoinstall comfy dwm environment

### Problems
* Bash prompt behaves strangely going up in history

### TODO:
* aurman
* VScode

### Steps (intended to use just after arch install):
1. Install git and clone repo
2. Run the install.sh as root (from dotfiles dir) and pass it your username
3. Start X (optional), run in nvim :PlugInstall

### Configure:
* uncomment color in etc/pacman.conf
* layouts
```
# cp misc/personal/keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
```
* hardware (touchpad, sound, wireless, etc)
```
For my lenovo g510                                                     
wifi       : $ aurman -S broadcom-wl
sound      : # pacman -S pulseaudio pamixer && reboot
brightness : # pacman -S xorg-xbacklight xf86-video-intel && reboot
touchpad   : # mv misc/personal/touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf 
```

* dwm hotkeys
```
Uncomment needed lines in dwm's config.h
```
* for git not to ask pwd everytime:
```
$ git config --global credential.helper cache
$ git config --global credential.helper 'cache --timeout=3600'
```
* power saving
```
# pacman -S powertop
# cp misc/personal/powertop /etc/systemd/system/powertop.service
# systemctl enable powertop.service
```
