### suckless apps

Installation requires (on arch):
```
gcc make pkg-config
libx11 libxinerama libxft
```

Also, in my `config.h`s i use ubuntu fonts which pkg is called:
```
ttf-ubuntu-font-family
```

DWM has these patches applied:
```
uselessgap pertag
```

The colors of dwm are default, st's colors are default except for background
color, which is set to `#222222` to match dwm.
