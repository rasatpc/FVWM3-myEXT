#!/bin/bash
## Checks if online and new update.

yad --form --width=350 --height=40 --title="Confirm" --text-align=center --text="<b>Do you want to check for new myExt update?</b>" \
--button=No:1 --button=Yes:0
if [ $? -ne 0 ]; then
  rm install.tmp output.tmp
  exit
else
  ping -q -c1 github.com &>/dev/null && echo online || test="offline"
	if [ $test = offline ]; then
	yad --width=300 --height=30 --title="Alert" --text-align=center  \
	--text="<b>You are offline, check github.com or your device connection.</b>" --button=Close:0
	else
	cd ~/.fvwm/extraEXT/scripts/InstallExt/download/ || exit
	wget https://raw.githubusercontent.com/rasatpc/FVWM3-myEXT/main/version.txt
	verGit=$(grep -oE '[0-9]+\.[0-9]+\.[0-9]+' download/version.txt)
	verLocal=$(grep -oE '[0-9]+\.[0-9]+\.[0-9]+' ~/.fvwm/version.txt)
		if [ "$verGit" -eq "$verLocal" ]; then
		echo "No new update.";
		else
		echo "New update available.";
		yad --form --width=350 --height=40 --title="Confirm" --text-align=center \
		--text="<b>New update available, want to download?</b>" --button=No:1 --button=Yes:0
  			if [ $? -ne 0 ]; then
  			rm install.tmp output.tmp
			exit
			else
			~/.fvwm/extraEXT/scripts/InstallExt/update.sh
			fi
		fi
	fi
fi
exec 3>&-
