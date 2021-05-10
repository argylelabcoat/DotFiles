#!/bin/sh
xrandr --output eDP-1 --mode 0x66
xrandr --output DP-2-1 --right-of DP-1-2
xrandr --output eDP-1 --left-of DP-1-2
numlockx on
feh --bg-fill ~/.wallpaper 
