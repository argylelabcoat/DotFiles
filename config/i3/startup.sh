#!/bin/sh
xrandr --output eDP-1 --mode 1920x1080
picom &
mpd &
feh --bg-fill /usr/share/backgrounds/budgie/coffee_on_bench_by_mikesh_kaos.jpg &
shutter --min_at_startup &
## xcompmgr -cC -t-5 -l-5 -r10 -o.33 &
# xscreensaver -no-splash &
xpad &
udiskie -s -a -n &
qtpass &
#sleep 2 && conky &
#
