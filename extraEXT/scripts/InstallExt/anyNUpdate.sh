#!/bin/bash
## At startup, checks if new update.

  ping -q -c1 github.com &>/dev/null && echo online || test="offline"
  
	if [ $test = offline ]; then
	
	exec 3>&-
	
	else
	
	cd ~/.fvwm/extraEXT/scripts/InstallExt/download/ || exit
	wget https://raw.githubusercontent.com/rasatpc/FVWM3-myEXT/main/version.txt
	
	verGit=$(grep -oE '[0-9]+\.[0-9]+\.[0-9]+' version.txt)
	verLocal=$(grep -oE '[0-9]+\.[0-9]+\.[0-9]+' ~/.fvwm/version.txt)
	
		if [ "$verGit" = "$verLocal" ]; then
		rm *
		exec 3>&-
		
		else
		
		yad --width=360 --height=30 --title="Confirm" --text-align=center \
		--text="<b>New upgrade available ( $verGit ) </b>" --button=Close:0
		
  			if [ $? -ne 0 ]; then
  			rm *
  			cd ~/.fvwm/extraEXT/scripts/InstallExt/
  			rm *.tmp
			exit
			fi
			
		fi
	fi
	
exec 3>&-
