#!/bin/bash
# By Jose Stack Overflow 9 Mar 2022
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

## Copy new CoreExt.sys and ExtraExt.sys as *.NEW to compare with previous CoreExt.sys.BAK and ExtraExt.sys.BAK

cp ~/.fvwm/extraEXT/scripts/InstallExt/default/ExtraExt.sys ~/.fvwm/Backup/ExtraExt.sys.NEW
cp ~/.fvwm/extraEXT/scripts/InstallExt/default/CoreExt.sys ~/.fvwm/Backup/CoreExt.sys.NEW

## Checks last date of update, old and new number Core and Extra extensions.

	LastUpdate=$(awk 'NR==1 {print $1 $2 $3}' ~/.fvwm/version.txt)
	OldCore=$(grep -c "Read" ~/.fvwm/Backup/CoreExt.sys.BAK)
	NewCore=$(grep -c "Read" ~/.fvwm/Backup/CoreExt.sys.NEW)
	OldExtra=$(grep -c "Read" ~/.fvwm/Backup/ExtraExt.sys.BAK)
	NewExtra=$(grep -c "Read" ~/.fvwm/Backup/ExtraExt.sys.NEW)
	
	TotNewCore=$(echo "$(($NewCore-$OldCore))")
	TotNewExtra=$(echo "$(($NewExtra-$OldExtra))")
	
yad --width=350 --height=10 --title="Alert" --text-align=left \
  --text="\n <b>Last update:</b> $LastUpdate \n <b>Total Core: </b>$OldCore <b>new:</b> $TotNewCore \n <b>Total Extra:</b> $OldExtra <b>new: </b>$TotNewExtra  \n \n<b>When there are new extensions,</b> \n compare CoreExt.sys and ExtraExt.sys \n with new ones (.BAK and .NEW) in folder: \n <b>~/.fvwm / Backup </b>\n \n <b>Close installer</b>, left-click and Restart myExt." --button=OK:0

cd ~/.fvwm/extraEXT/scripts/InstallExt/download/
rm *
  
# Restart
killall -SIGUSR1 fvwm3
