This function checks for Fvwm2 compatibility.

1. Copy start.config to /.fvwm and rename it "config".

2. At startup, the script checks if Fvwm2 and replaces the /.fvwm/config with /files-org/config.

3. If Fvwm3, removes /.fvwm/config and copies files-org/local.config to /.fvwm.

Add the below line below where required to make the check.
Read $[CORE_DIR]/1Functions/verCheck/verCh.sys
