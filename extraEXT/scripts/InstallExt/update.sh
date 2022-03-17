#!/bin/bash
## Checks if online and downloads latest myExt package.

yad --form --width=350 --height=40 --title="Confirm" --text-align=center --text="<b>Do you want to check for new myExt update?</b>" \
--button=No:1 --button=Yes:0
if [ $? -ne 0 ]; then
  exit
else
  ping -q -c1 github.com &>/dev/null && echo online || test="offline"
  if [ $test = offline ]; then
  yad --width=300 --height=30 --title="Alert" --text-align=center  \
  --text="<b>You are offline, check github.com or your device connection.</b>" --button=Close:0
  else
  cd ~/.fvwm/extraEXT/scripts/InstallExt/download/
  
  download(){
    wget  "$1" 2>&1 | sed -u  "s/.* \([0-9]\+%\)\ \+\([0-9,.]\+.\) \(.*\)/\1\n# Downloading at \2\/s, ETA \3/"
    RET_WGET="${PIPESTATUS[0]}"             # get return code of wget
    if [[ "$RET_WGET" = 0 ]]                # check return code for errors
      then
         echo "#100%"
         echo "#Upgrade COMPLETED!!."
      else
         echo "#Download ERROR."
    fi
  }

	download https://github.com/rasatpc/FVWM3-myEXT/archive/refs/heads/main.zip | yad --progress \
    --pulsate --width=300 --height=40 --title="Downloading myExt..."
    
  unzip main.zip
  yad --form --width=370 --height=40 --title="Update" --text-align=center \
  --text="<b>Close Extension Installer, and Restart myExt.</b>" --button=OK:0
  fi
fi
exec 3>&-
