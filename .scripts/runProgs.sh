#!/bin/bash

#reset programs before running again
killall picom
killall blueman-applet
killall nm-applet
killall dunst

sleep 1
#activate compositor
picom --experimental-backends & 
blueman-applet &
nm-applet &
dunst &
#$($HOME/.scripts/wallpaper.sh)

bluetoothctl power off
exit
