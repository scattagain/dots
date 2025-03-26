#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run dunst
# run picom -b
run xcompmgr -n -F
run flameshot &
run light-locker
run xbindkeys

setxkbmap -option compose:caps
