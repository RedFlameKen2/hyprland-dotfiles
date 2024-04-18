#!/bin/bash

volume="$(amixer -D pulse sget Master | grep 'Left:' | awk -F '[][]' '{print $2}' | tr -d '%')"

percent(){
    echo $volume
}
icon(){
    if [ $volume -gt "66" ]
    then
	icon="󰕾"
    elif [ $volume -gt "33" ]
    then
        icon=""
    elif [ $volume -gt "0" ]
    then
        icon=""
    else
	icon="󰝟"
    fi
    
    echo $icon
}
[ "$1" = "icon" ] && icon && exit
[ "$1" = "percent" ] && percent && exit
exit
