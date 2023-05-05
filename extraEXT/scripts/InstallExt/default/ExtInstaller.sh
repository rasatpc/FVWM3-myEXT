#!/bin/bash
# By Misko - Yad Command Google Forum 10 Mar 2022
# By rasat 22 Mar 2022
######## IMPORTANT: NO SPACE BETWEEN LINES ##########
# At startup, checks if new update.
	cd ~/.fvwm/extraEXT/scripts/InstallExt/
	./anyNUpdate.sh
if ! [ -x "$(command -v awk)" ]; then
   yad --form --width=360 --height=40 --title="Alert" --text-align=center \
  --text="<b>Requires gawk to run Ext Installer.</b>" --button=OK:0
  exit
fi
cd ~/.fvwm/extraEXT/scripts/InstallExt/
split_arg () {
 echo -e "\f"
 echo "$5"
}
export -f split_arg
export fpipe="$(mktemp -u --tmpdir fvwmei.XXXXXXXX)"
mkfifo "$fpipe"
trap "rm "$fpipe"" EXIT
exec 3<> "$fpipe"
key=$RANDOM
yad --plug=$key --tabnum=1 \
    --select-action='bash -c "split_arg %s >$fpipe"' \
    --hide-column=5 \
    --list --checklist \
    --width=900 --height=680 \
    --separator=" " \
    --column=Y/n --column="Type" \
    --column=Extra-Extensions --column=Description --column="" --column=# \
TRUE Functions "<b>Auto Hide List</b>" "Hides widgets not to use desktop space." "images/auto-hide.png" 101 \
TRUE Functions "<b>Auto Move Windows</b>" "Moves apps to a specific workspace." "images/auto-move.png" 102 \
TRUE Functions "<b>Thumbnails</b>" "Iconified windows." "images/thumbnails.png" 103 \
TRUE Styles "<b>My Border Style</b>" "Thin window border." "images/my-border.png" 201 \
TRUE Menus "<b>My Menu</b>" "Menu list pop up bindings, hook and panel." "images/my-menu.png" 301 \
false Bindings "<b>Diary Mouse Binding</b>" "Set of Dairy theme mouse button actions." "images/d-mouse-bind.png" 401 \
TRUE Bindings "<b>My Key Binding</b>" "VM desk (alt-d), Thumbnail (alt-t), etc." "images/key-bind.png" 402 \
TRUE Decorations "<b>My Decor</b>" "Simple title bar." "images/my-decor.png" 501 \
false Decorations "<b>Diary Decor</b>" "Right-side title bar based on addy-fe's theme." "images/diary-decor.png" 502 \
false Decorations "<b>QNX Decor</b>" "MultiPixmap option to place transitional images." "images/qnx-decor.png" 503 \
false Modules "<b>Control Pager Button</b>" "Pager, 2x2 miniture view of desktop." "images/control-pg.png" 601 \
TRUE Modules "<b>Dash To Dock</b>" "Application panel bar." "images/dash-to-d.png" 602 \
false Modules "<b>Extension Switch</b>" "Preview of different extension setup." "images/ext-switch.png" 604 \
false Modules "<b>MyRight Panel</b>" "Modified Fvwm Right Panel." "images/my-right-panel.png" 606 \
false Modules "<b>Task Buttons Curve</b>" "Task bar based on Somatic theme." "images/task-curve.png" 607 \
TRUE Modules "<b>Wifi Sound Panel</b>" "Small wifi and sound tray." "images/wifi-sound.png" 612 \
TRUE Modules "<b>Task Buttons Flux</b>" "Fluxbox style of task bar." "images/task-flux.png" 608 \
TRUE Modules "<b>Time/Day Button</b>" "Date, time, and calendar panel." "images/time-day.png" 609 \
TRUE Modules "<b>Vertical Pager 1x5</b>" "Miniature view of desktops (1x5)." "images/pager1x5.png" 610 \
false Modules "<b>Vertical Pager 2x4</b>" "Miniature view of desktops (2x4)." "images/pager2x4.png" 611 \
false Modules "<b>Exit Menu</b>" "Shotdown, Reboot, Suspend, Lock." "images/exit-menu.png" 613 \
	>output.tmp &
yad --plug=$key --tabnum=2 --list --no-headers --listen --cycle-read --column=":IMG" <&3  &
yad --paned --key=$key --title="Extension Installer" \
    --button=Close:1 --button='Reset:bash -c "./reset.sh"' --button='Upgrade myExt:bash -c "./checkLine-Update.sh"' --button=Install:0 --center --orient=Horizontal --splitter=690 --width=870 --height=660
exec 3>&-
# Change all extension to false.
awk '{print $1 " " $NF}' output.tmp > install.tmp
if [ -s install.tmp ]
	then
sed -i 's/TRUE/false/g' ExtInstaller.sh #CODE
		./extraInstall.sh
	else
		exit
fi
