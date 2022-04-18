# readme-tbf.txt

To install or edit .fvwm/ExtraEXT.sys

Install coreEXT/1Functions/MyInitMgr/
Install coreEXT/MODULES/FvwmOverView/

## Add the below line below "Modules".
Read $[EXTRA_DIR]/MODULES/TaskButtonsFlux/action/fluxSouth.conf #608

## Center TaskButtonsFlux postion as per screen resolution.
## Add below line in 1Functions/MyInitMgr/myInitMgr.sys (without "#").
Test (x xdpyinfo) Exec $[CORE_DIR]/1Functions/MyInitMgr/scripts/ButtonScreenPosition.sh

## Add below line in 1Functions/MyInitMgr/scripts/ButtonScreenPosition.sh
sed -i "/1020x36/c\*TaskButtonsFlux: Geometry 1020x36-$3-18" "$path/extraEXT/MODULES/TaskButtonsFlux/taskBFlux.sys"

## Any addon or modification in .fvwm/UserEXT.sys
