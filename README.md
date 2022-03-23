# myEXT
FVWM3 myExt is the base of core and extra extensions for public usage. A collection of ready-made Fvwm configs inspired by the Gnome Extensions and other plugins that makes a DE/WM multifunctional. This gave the name "FVWM myExtensions". Started as an experiment and became a fully functional base that makes daily computer workflow simpler and more efficient.

This is a user-oriented model for you to use, modify and create your own extensions. They are placed in ~/.fvwm folder. The extensions are divided into three main folders (core, extra, and user) and system files that run in the same sequence as the original Fvwm config. The additional extensions are simply added in associated folders. One graphical Extension Installer is included making it user-friendly for those who prefer a quick setup of their choice.

* coreEXT  (coreEXT.sys)	- essential myExt configs.
* extraEXT (extraEXT.sys) - additional configs.
* userEXT  (userEXT.sys)  - user configs, does changes to core and extra config settings.

# HOW TO INSTALL
One time install and then updgraded with Extension Installer.

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
* git clone https://github.com/fvwmorg/fvwm3.git
* cd fvwm3

Read dev-docs/INSTALL.md

* ./autogen.sh
* ./configure --enable-mandoc
* make
* sudo make install

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

# Optional (recommended)

* sudo apt install rofi

Copy .fvwm/setup/rofi to .config/

* sudo apt install xfce4-appfinder
* sudo pacman -Syu xfce4-appfinder

# Read more in .fvwm/setup/install.txt
