# readme-tbf.txt

To install or edit .fvwm/ExtraEXT.sys

Install coreEXT/1Functions/MyInitMgr/

## Add the below line below "Modules".
Read $[EXTRA_DIR]/MODULES/TaskButtonsFlux/action/fluxSouth.conf #608

## Center TaskButtonsFlux postion as per screen resolution.
## Add below line in 1Functions/MyInitMgr/myInitMgr.sys (without "#").
Test (x xdpyinfo) Exec $[CORE_DIR]/1Functions/MyInitMgr/scripts/ButtonScreenPosition.sh

## Add below line in 1Functions/MyInitMgr/scripts/ButtonScreenPosition.sh
sed -i "/1020x36/c\*TaskButtonsFlux: Geometry 1020x36-$3-18" "$path/extraEXT/MODULES/TaskButtonsFlux/taskBFlux.sys"

## Any addon or modification in .fvwm/UserEXT.sys

## Fvwm Kise

Copy .fvwm/extraEXT/MODULES/TaskButtonsFlux to .fvwm/user. Add this line in .fvwm/userExt.sys in MODULES section.
Read $[USER_DIR]/TaskButtonsFlux/action/fluxSouth.conf

IMPORTANT:
Edit/untag where there is an Fvwm Kise label.

