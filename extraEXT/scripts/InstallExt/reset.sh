#!/bin/bash

yad --form --width=350 --height=70 --title="Confirm" --text-align=center --text="<b>Do you want to rest the extension list (default)?</b>" \
--button=No:1 --button=Yes:0
if [ $? -ne 0 ]; then
  exit
else
  echo Reset done!
  cp -f default/ExtInstaller.sh ~/.fvwm/extraEXT/scripts/InstallExt/ExtInstaller.sh
  cp default/ExtraExt.sys ~/.fvwm/ExtraExt.sys
  yad --form --width=400 --height=60 --title="Alert" --text-align=center \
  --text="<b>Close the Extension Installer, and Restart myExt.</b>" --button=OK:0
fi
exec 3>&-
