## dotfiles and script to autoinstall comfy dwm environment

### Todo
* neovim clipboard (xclip)
* ranger as sudo uses editor vim (maybe create a symlink for `nvim` called `vim` in `/bin`)
* ranger image preview (problem: no w3mimgpreview)
* find useful dwm patches (swallow)
* pipe all output to log file (simple?)
* uncomment color in /etc/pacman.conf

Steps (intended to use just after arch install):
1. Install git and clone repo
1. Run the install.sh as root (from dotfiles dir) and pass it your username
1. Start X (optional), run in nvim :PlugInstall

Next is optional (just for me) (saying like someone else uses this crap):
1. Configure locales
1. Configure git not to ask pwd everytime
1. Configure hardware (touchpad, sound, wireless, etc)
1. Configure dwm hotkeys (brightness, volume, scrot)
