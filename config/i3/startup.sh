#!/bin/sh

case $HOSTNAME in
  (SpinachFetaPizza) ./SpinachFetaPizza.sh;;
  (lilamd)      echo "I guess we are working from home";;
  (strongarm)   echo "Pinebook Fun";;
esac

numlockx on &
picom &
xpad &
udiskie -s -a -n 
# qtpass &
## xcompmgr -cC -t-5 -l-5 -r10 -o.33 &
# xscreensaver -no-splash &
# shutter --min_at_startup &
#sleep 2 && conky &
#mpd &
#
