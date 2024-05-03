#!/bin/bash

killall eww

sleep 1

eww daemon

eww open bar

sleep 2

eww update vol_level=$(pamixer --get-volume)
eww update mic_level=$(pamixer --default-source --get-volume)

exit
