## dotfiles and script to autoinstall comfy dwm environment

### Todo
1. Find useful dwm patches (swallow)
1. Configure git not to ask pwd everytime

Steps (intended to use just after arch install):
1. Install git and clone repo
1. Run the install.sh as root (from dotfiles dir) and pass it your username
1. Start X (optional), run in nvim :PlugInstall

Configure (just for me) (saying like someone else uses this crap):
1. uncomment color in etc/pacman.conf
1. layouts
1. hardware (touchpad, sound, wireless, etc)
1. dwm hotkeys (brightness, volume, scrot)
1. Autologin, autostartx
