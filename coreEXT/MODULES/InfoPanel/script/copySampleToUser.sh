#!/bin/sh

cd $HOME/.fvwm

# Check if file does not exist.
FILE=UserExt.sys
if [ ! -f "$FILE" ]; then
    cp UserExtSAMPLE.sys UserExt.sys
fi
