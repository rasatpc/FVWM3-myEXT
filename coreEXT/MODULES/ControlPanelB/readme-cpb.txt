# readme-cpb.txt

To install or edit .fvwm/CoreExt.sys
This config will READ MODULES/RestartShutdown package.

# Add the below line below "Load 7.Modules".
Read $[CORE_DIR]/MODULES/ControlPanelB/controlPanel.sys

## Any addon or modification in .fvwm/UserEXT.sys

## Fvwm Kise

Copy .fvwm/coreEXT/MODULES/ControlPanelB to .fvwm/user. Add this line in .fvwm/userExt.sys in MODULES section.
Read $[USER_DIR]/ControlPanelB/controlPanel.sys

IMPORTANT:
Edit/untag where there is an Fvwm Kise label.
