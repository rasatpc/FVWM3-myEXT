#!/bin/bash
# By Jose Stack Overflow 9 Mar 2022
# By rasat 10 March 2020
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

## Copy new ExtraExt.sys as ExtraExt.new to compare with previous ExtraExt.sys.

cp ~/.fvwm/extraEXT/scripts/InstallExt/default/ExtraExt.sys ~/.fvwm/ExtraExt.new

## Checks for number new extensions.

	oldExt=$(sed -n '$=' ~/.fvwm/ExtraExt.bak)
	newExt=$(sed -n '$=' ~/.fvwm/extraEXT/scripts/InstallExt/default/ExtraExt.sys)
	
yad --width=300 --height=10 --title="Alert" --text-align=center \
  --text="\n<b>Old:</b> $oldExt and <b>New:</b> $newExt extra extensions.\n \n<b>If old and new differs, compare ExtraExt.sys with ExtraExt.new</b>\n \n Close installer, left-click and Restart myExt." --button=OK:0
  
# Restart
killall -SIGUSR1 fvwm3
