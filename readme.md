## dotfiles and script to autoinstall comfy dwm environment

### Todo
* neovim clipboard
* PS1 prompt behaves strangely after going up in history
* ranger as sudo uses editor vim
* ranger image preview (problem: no w3mimgpreview)

Steps (intended to use just after arch install):
1. Install git and clone repo
1. Run the install.sh as root (from dotfiles dir) and pass it your username
1. Start X (optional), run in nvim :PlugInstall

Next is optional (just for me) (saying like someone else uses this crap):
1. Configure locales
1. Configure git not to ask pwd everytime
1. Configure hardware (touchpad, sound, wireless, etc)
1. Configure dwm hotkeys (brightness, volume, scrot)
1. Uncomment color in /etc/pacman.conf
