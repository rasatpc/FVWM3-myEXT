#!/bin/bash
# By rasat 18 March 2023
# Updates ExtInstaller.sh and ExtraExt.sys as per checklist.

# Tag all Read lines.
sed -i 's/Read/# Read/g' ~/.fvwm/ExtraExt.sys
sed -i 's/# # Read/# Read/g' ~/.fvwm/ExtraExt.sys

# Reset line #CODE to TRUE/false
sed -i "/#CODE/c\sed -i 's/TRUE/false/g' ExtInstaller.sh #CODE" ExtInstaller.sh

# Update ExtraExt.sys extensions.
search=$(awk 'BEGIN{OFS=ORS=""}{if(NR>1){print "|"}print $2;}' install.tmp)
sed -i -r "s/^# (.*#($search))$/\1/g" ~/.fvwm/ExtraExt.sys

# Update ExtInstaller.sh
awk '
NR==FNR {a[$2] = $1; next}
$(NF-1) in a {$1 = a[$(NF-1)]}
1' install.tmp ExtInstaller.sh > tmp.sh
cp tmp.sh ExtInstaller.sh
rm tmp.sh
rm ~/.fvwm/extraEXT/scripts/InstallExt/*.tmp

## Copy new ExtraExt.sys as ExtraExt.sys.NEW to compare with previous ExtraExt.sys.BAKup

cp ~/.fvwm/extraEXT/scripts/InstallExt/default/ExtraExt.sys ~/.fvwm/Backup/ExtraExt.sys.NEW

## Checks last update, old and new number Core and Extra extensions.
## Before any updates, edit ~/.fvwm/Backup/ExtOld-NewNo.txt.

	LastUpdate=$(awk 'NR>1 {print $2}' ~/.fvwm/Backup/ExtOld-New.txt)
	OldCore=$(awk 'NR>1 {print $4}' ~/.fvwm/Backup/ExtOld-New.txt)
	NewCore=$(awk 'NR>1 {print $6}' ~/.fvwm/Backup/ExtOld-New.txt)
	OldExtra=$(awk 'NR>1 {print $8}' ~/.fvwm/Backup/ExtOld-New.txt)
	NewExtra=$(awk 'NR>1 {print $10}' ~/.fvwm/Backup/ExtOld-New.txt)
	
yad --width=350 --height=10 --title="Alert" --text-align=left \
  --text="\n LAST Update: <b>$LastUpdate</b>\n <b>Total Core: </b>$OldCore <b>new:</b> $NewCore \n <b>Total Extra:</b> $OldExtra <b>new: </b>$NewExtra  \n \n<b>When there are new extensions,</b> \n compare CoreExt.sys and ExtraExt.sys \n with new ones in folder: \n <b>/ Backup / ExtOld-New.txt</b> \n \n <b>Close installer</b>, left-click and Restart myExt." --button=OK:0
  
# Restart
killall -SIGUSR1 fvwm3
