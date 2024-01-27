# readme-cpgd.txt

This config will READ ControlPanelB package (including RestartShutdown).

To install or edit .fvwm/ExtraEXT.sys

## Add the below line below "Modules" at end of configs.
Read $[EXTRA_DIR]/MODULES/ControlPagerB/controlPg.sys #601

## Any addon or modification in .fvwm/UserEXT.sys

## Fvwm Kise

Copy .fvwm/extraEXT/MODULES/ControlPagerB to .fvwm/user. Add this line in .fvwm/userExt.sys in MODULES section.
Read $[USER_DIR]/ControlPagerB/controlPg.sys

IMPORTANT:
Edit/untag where there is an Fvwm Kise label.
