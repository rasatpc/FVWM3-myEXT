readme-wpg.txt

To install or edit  .fvwm/ExtraEXT.sys

## Add this line below "Modules".
Read $[EXTRA_DIR]/MODULES/WorkVpager/wVPager.sys #613

Install AutoMoveWin to move applications to a specific workspace (page) when they create windows.
Read $[USER_DIR]/AutoMoveWin/autoMoveW.sys

## Any addon or modification in .fvwm/UserEXT.sys

## Fvwm Kise

Copy .fvwm/extraEXT/MODULES/WorkVpager to .fvwm/user. Add this line in .fvwm/userExt.sys in MODULES section.
Read $[USER_DIR]/WorkVpager/wVPager.sys

IMPORTANT:
Edit/untag where there is an Fvwm Kise label.
