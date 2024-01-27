# readme-fd.txt

FvwmDecors is a collection of fancy window borders for FVWM by robinlily
https://fvwmforums.org/t/some-fancy-decors-and-a-color-picker/4180/1

To install, edit $[EXTRA_DIR]/Menus/MyMenu/mMenu.conf

## Set The Image and Icon Folder
SetEnv mtmb $[EXTRA_DIR]/Decors/FancyDecor/decorthumb

Add "Decors" menu below Wallpapers

## Background Menu
DestroyMenu BGMenu
AddToMenu   BGMenu "WALLPAPERS" Title
+ "Decors%$[micon]/wallpaper.png%" Popup TDecors

## Background Decors
DestroyMenu TDecors
AddToMenu   TDecors "FANCY DECORS" Title
+ "Apple Aqua%$[mtmb]/Thumb_aqua.png%" Read $[EXTRA_DIR]/Decors/FancyDecor/Decors/aqua.decor
+ "Award%$[mtmb]/Thumb_award.png%" Read $[EXTRA_DIR]/Decors/FancyDecor/Decors/award.decor
+ "Blue Wing%$[mtmb]/Thumb_bluewing.png%" Read $[EXTRA_DIR]/Decors/FancyDecor/Decors/blue_wing.decor
+ "Celtic%$[mtmb]/Thumb_celtic.png%" Read $[EXTRA_DIR]/Decors/FancyDecor/Decors/celtic.decor
+ "Flat%$[mtmb]/Thumb_flat.png%" Read $[EXTRA_DIR]/Decors/FancyDecor/Decors/flat.decor
+ "Gold Leaf%$[mtmb]/Thumb_goldleaf.png%" Read $[EXTRA_DIR]/Decors/FancyDecor/Decors/goldleaf.decor
+ "Nouveau%$[mtmb]/Thumb_nouveau.png%" Read $[EXTRA_DIR]/Decors/FancyDecor/Decors/nouveau.decor
+ "Red and Gold%$[mtmb]/Thumb_redgold.png%" Read $[EXTRA_DIR]/Decors/FancyDecor/Decors/redgold.decor
+ "Starry%$[mtmb]/Thumb_starry.png%" Read $[EXTRA_DIR]/Decors/FancyDecor/Decors/starry.decor

## Fvwm Kise

Copy .fvwm/extraEXT/Decors/FancyDecor to .fvwm/user.

IMPORTANT:
Edit/untag where there is an Fvwm Kise label.
