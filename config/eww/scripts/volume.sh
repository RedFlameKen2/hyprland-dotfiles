#!/bin/bash

volume="$(amixer -D pulse sget Master | grep 'Left:' | awk -F '[][]' '{print $2}' | tr -d '%')"

volstat="$(amixer -D pulse sget Master | grep 'Left:' | awk -F '[][]' '{print $4}')"
mute(){
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    
    newvolstat="$(amixer -D pulse sget Master | grep 'Left:' | awk -F '[][]' '{print $4}')"

    if [ $newvolstat == "off" ]
    then
	echo muted
    else
	echo "$volume%"
    fi
}

percent(){
    echo $volume
}

icon(){
    if [ $volstat == "off" ]
    then
	icon="󰝟"
    elif [ $volume -gt "66" ]
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
up(){
    pactl set-sink-volume @DEFAULT_SINK@ +5% 
    echo $((volume + 5))
}

down(){
    pactl set-sink-volume @DEFAULT_SINK@ -5% 
    echo $((volume - 5))
}

[ "$1" = "up" ] && up && exit
[ "$1" = "down" ] && down && exit
[ "$1" = "icon" ] && icon && exit
[ "$1" = "percent" ] && percent && exit
[ "$1" = "mute" ] && mute && exit
exit
