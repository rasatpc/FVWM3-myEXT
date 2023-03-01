## 12-Feb-2023 by ceeslans
## https://forum.mxlinux.org/viewtopic.php?t=73992
## Yad man page: https://manpages.debian.org/testing/yad/yad.1.en.html

# Required by Exit menu
sudo apt install yad
pacman -Syu yad

# Configuration
script/fblogout.conf

# Theme
1. Create one new theme folder with gtk.css file:
$HOME/.themes/Exit-menu/gtk-3.0/gtk.css

2. gtk.css (must be written as mentioned here below).

button { color: black; background-color: #4f94ce; }
#yad-dialog-window { background-color: #ffffff; }
button:hover { background-color: #5ea9e8; }

3. Add theme name in script/fblogout

GTK_THEME="Exit-menu" \
yad --center --borders=4 --class="yad-fblogout" .........

Screenshot:
https://rasatpc.net/screenshot/myExt/Exit-Action/white-blue-exit-menu.png

