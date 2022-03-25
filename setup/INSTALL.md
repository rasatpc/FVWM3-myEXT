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
* yay -S fvwm3

Installing from Git FVWM3:

Dependencies:
* sudo apt-get install libevent-dev libx11-dev libxrandr-dev libxrender-dev libxt-dev libfontconfig-dev asciidoctor libfreetype6-dev libfribidi-dev libncurses5-dev libpng-dev libreadline-dev libsm-dev libxcursor-dev libxext-dev libxft-dev libxi-dev libxpm-dev sharutils

* sudo pacman -Syu <same packages>

Install dependencies:
* sudo apt-get install automake autoreconf autogen
* sudo pacman -Syu automake autoreconf autogen

Read dev-docs/INSTALL.md

* git clone https://github.com/fvwmorg/fvwm3.git
* cd fvwm3
* ./autogen.sh
* ./configure --enable-mandoc
* make
* sudo make install

COPY ~/.fvwm/setup/fvwm.desktop to /usr/share/xsessions/

# myExt dependencies

Volume Icon (add icon in system tray):
* sudo apt install volumeicon-alsa
* sudo pacman -Syu volumeicon

Required by Extention Installer:
* sudo apt install yad
* sudo apt install gawk

* sudo pacman -Syu yad
* sudo pacman -Syu gawk

Required by Thumbnails:
* sudo apt install imagemagick-common
* sudo pacman -Syu imagemagick

FvwmButton configs to adjust as per screen resolution:
* sudo apt install x11-utils
* sudo pacman -Syu xorg-xdpyinfo

Network wifi:
* sudo apt-get install stalonetray
* sudo pacman -Syu stalonetray

Search app:
* sudo apt install rofi rofi-calc
* sudo pacman -Syu rofi rofi-calc

Copy .fvwm/setup/rofi to .config/

* sudo apt install xfce4-appfinder
* sudo pacman -Syu xfce4-appfinder

Look & Feel:
* sudo apt install lxappearance
* sudo pacman -Syu lxappearance

Touchpad:
* sudo apt install xserver-xorg-input-synaptics
* sudo pacman -Syu xserver-xorg-input-synaptics

# Read more in .fvwm/setup/install.txt
