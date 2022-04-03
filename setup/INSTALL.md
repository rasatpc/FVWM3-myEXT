# HOW TO INSTALL
One time install and then updgrade with the Extension Installer.

Download:
* https://github.com/rasatpc/FVWM3-myEXT/archive/refs/heads/main.zip

Extract and copy subfolders to ~/.fvwm

# FVWM3 myExt requirement

INSTALL Fvwm3

Debian based Linux:
* sudo apt install fvwm3

Arch Linux:
* sudo yay -S fvwm3

Fedora:
* sudo dfn install fvwm3

Installing from Git FVWM3:

Important dependencies for installation and usage:
* sudo apt-get install libevent-dev libx11-dev libxrandr-dev libxrender-dev libxt-dev
* sudo apt-get install asciidoctor libfontconfig-dev libfreetype6-dev libfribidi-dev libncurses5-dev libpng-dev libreadline-dev libsm-dev libxcursor-dev libxext-dev libxft-dev libxi-dev libxpm-dev sharutils

* sudo pacman -Syu <same 19x packages>

* sudo dnf install libevent-devel libX11-devel libXrandr-devel libXt-devel
* sudo dnf install rubygem-asciidoctor fontconfig-devel freetype-devel fribidi-devel ncurses-devel libpng-devel readline-devel librsvg2-devel libSM-devel libXcursor-devel libXext-devel libXft-devel libXi-devel libXpm-devel sharutils 

Make/install dependencies:
* sudo apt-get install automake dh-autoreconf autogen
* sudo pacman -Syu automake autoreconf autogen
* sudo dnf install automake dh-autoreconf autogen

Read dev-docs/INSTALL.md

* git clone https://github.com/fvwmorg/fvwm3.git
* cd fvwm3
* ./autogen.sh
* ./configure --enable-mandoc
* make
* sudo make install

# For login manager
* COPY ~/.fvwm/setup/fvwm.desktop to /usr/share/xsessions/

# myExt dependencies

Volume Icon (add icon in system tray):
* sudo apt install volumeicon-alsa
* sudo pacman -Syu volumeicon
* sudo pacman -Syu volumeicon

Required by Extention Installer:
* sudo apt install yad gawk sed wget
* sudo pacman -Syu yad gawk sed wget
* sudo dnf install yad gawk sed wget

Required by Thumbnails:
* sudo apt install imagemagick-common
* sudo pacman -Syu imagemagick
* sudo dnf install ImageMagick xwd

FvwmButton configs to adjust as per screen resolution:
* sudo apt install x11-utils
* sudo pacman -Syu xorg-xdpyinfo
* sudo dnf install xdpyinfo

Network wifi:
* sudo apt-get install stalonetray
* sudo pacman -Syu stalonetray
* sudo dnf install stalonetray

Search app:
* sudo apt install rofi
* sudo pacman -Syu rofi
* sudo dnf install rofi

Copy .fvwm/setup/rofi to .config/

* sudo apt install xfce4-appfinder
* sudo pacman -Syu xfce4-appfinder
* sudo dnf install xfce4-appfinder

Look & Feel:
* sudo apt install lxappearance
* sudo pacman -Syu lxappearance
* sudo dnf install lxappearance

Touchpad:
* sudo apt install xserver-xorg-input-synaptics
* sudo pacman -Syu xf86-input-synaptics
* sudo dnf install xorg-x11-drv-synaptics

# Read more in .fvwm/setup/install.txt
