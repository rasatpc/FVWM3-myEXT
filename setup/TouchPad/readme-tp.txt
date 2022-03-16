## How to turn off touchpad.

# To install
sudo apt install xserver-xorg-input-synaptics
pacman -Syu xf86-input-synaptics

## Add below lines in .fvwm/config (including "#")
# TouchPad Off
Test (x synclient) Exec synclient TouchpadOff=1
