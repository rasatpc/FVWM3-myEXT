#!/bin/bash

cd ~/.fvwm/coreEXT/1Functions/verCheck/script/
fvwm3 -V > ver.txt
fvwm -V > ver.txt
awk 'NR==1{print $2}' ver.txt > tmp.txt
verFvwm=$(sed 's/.[0-9]$//' tmp.txt)

if [ $verFvwm = 2.6 ]; then
cp ~/.fvwm/coreEXT/1Functions/verCheck/files-org/config ~/.fvwm/
rm *.txt
exit
else
cp ~/.fvwm/coreEXT/1Functions/verCheck/files-org/local.config ~/.fvwm
rm ~/.fvwm/config
rm *.txt
exit
fi

