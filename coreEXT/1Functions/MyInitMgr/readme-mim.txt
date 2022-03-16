The start function is the function of Fvwm that runs after it has loaded the defaults settings. In this function you can preform you basic ‘StartUp’ actions.
https://www.fvwm.org/Wiki/Config/StartFunction/

This init manager config loads wifi, screen brightness & battery, sound volume, and root authorization.

To install or edit .fvwm/local.config

## Add the below line below "Load default 1.Functions".
Read $[CORE_DIR]/1Functions/MyInitMgr/myInitMgr.sys

## Any addon or modification in .fvwm/userEXT.sys
Screen position script
16-Dec-2021 by qinohea Trilby
https://bbs.archlinux.org/viewtopic.php?id=271659

Required by differen FvwmButton configs (adjust per screen resolution)
sudo apt install x11-utils
sudo pacman -Syu xorg-xdpyinfo

## Copy these 3 lines to myInitMgr.sys

## Center extraEXT/MODULES/TaskButtonsFlux postion as per screen resolution.
## Needs xdpyinfo installed.
Test (x xdpyinfo) Exec $[CORE_DIR]/1Functions/MyInitMgr/scripts/ButtonScreenPosition.sh
