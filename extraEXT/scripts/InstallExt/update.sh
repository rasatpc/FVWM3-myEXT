#!/bin/bash
## Downloads latest myExt package.

## Backup ExtraExtT.sys
cp ~/.fvwm/ExtraExt.sys ~/.fvwm/extraEXT/scripts/InstallExt/backup/ExtraExt.sys.bak
cp ~/.fvwm/ExtraExt.sys ~/.fvwm/Backup/ExtraExt.sys.BackUp

## Create output.tmp
cd ~/.fvwm/extraEXT/scripts/InstallExt/
grep '^TRUE' ExtInstaller.sh > outputUpg.tmp

## Download
cd ~/.fvwm/extraEXT/scripts/InstallExt/download/

download(){
    wget  "$1" 2>&1 | sed -u  "s/.* \([0-9]\+%\)\ \+\([0-9,.]\+.\) \(.*\)/\1\n# Downloading at \2\/s, ETA \3/"
    RET_WGET="${PIPESTATUS[0]}"             # get return code of wget
    if [[ "$RET_WGET" = 0 ]]                # check return code for errors
      then
         echo "#100%"
         echo "#Upgrade COMPLETED"
      else
         echo "#Download ERROR"
         rm install.tmp output.tmp
         exit
    fi
  }

	download https://github.com/rasatpc/FVWM3-myEXT/archive/refs/heads/main.zip | yad --progress \
    --pulsate --width=300 --height=40 --title="Downloading myExt..."
    unzip main.zip
    cp -a ~/.fvwm/extraEXT/scripts/InstallExt/download/FVWM3-myEXT-main/. ~/.fvwm/
	rm -r ~/.fvwm/extraEXT/scripts/InstallExt/download/FVWM3-myEXT-main
    rm -r ~/.fvwm/extraEXT/scripts/InstallExt/download/*zip version.txt
    
  yad --form --width=300 --height=30 --title="Update" --text-align=center \
  --text="<b> Press UPGRADE to update myExt. </b>" --button=UPGRADE:0

# Update ExtInstaller.sh and ExtraExt.sys
cd ~/.fvwm/extraEXT/scripts/InstallExt/
  awk '{print $1 " " $(NF-1)}' outputUpg.tmp > install.tmp

if [ -s install.tmp ]
	then
sed -i 's/TRUE/false/g' ExtInstaller.sh #CODE
		./extraExtUpdate.sh
	else
		exit
fi
exec 3>&-
