# readme-tpc.txt

Based on David Lanham’s Somatic theme.
https://www.pling.com/p/1018278/

To install or edit .fvwm/ExtraEXT.sys

## Add the below line below "Modules".
Read $[EXTRA_DIR]/MODULES/TaskButtonsCurve/taskBCurve.sys #607

NOTE: Edit line in simpleB.sys (move to right side).
*SimpleButton: Geometry 500x50-250+0

## Any addon or modification in .fvwm/UserEXT.sys

## Fvwm Kise

Copy .fvwm/extraEXT/MODULES/TaskButtonsCurve to .fvwm/user. Add this line in .fvwm/userExt.sys in MODULES section.
Read $[USER_DIR]/TaskButtonsCurve/taskBCurve.sys

IMPORTANT:
Edit/untag where there is an Fvwm Kise label.
