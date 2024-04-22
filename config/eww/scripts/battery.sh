#!/bin/bash

bat=/sys/class/power_supply/BAT1/
per="$(cat "$bat/capacity")"

batstat(){
    echo "$(cat "$bat/status")"
}
icon() {
    [ $(cat "$bat/status") = charging ] && echo "󰂄" && exit
    if [ "$(cat "$bat/status")" == "Charging" ]
    then
	eww update charging=true
    else
	charging=$(eww get charging)
	if [ "$charging" == "true" ]
	then
	    eww update charging=false
	fi
    fi
    if [ "$per" == "100" ]
    then
	eww update full_charge=true
    else
	charging=$(eww get full_charge)
	if [ "$charging" == "true" ]
	then
	    eww update full_charge=false
	fi
    fi
    if [ "$per" -gt "90" ]
    then
	icon="󰁹"
    elif [ "$per" -gt "80" ]
    then
	icon="󰂂"
    elif [ "$per" -gt "70" ]
    then
	icon="󰂁"
    elif [ "$per" -gt "60" ]
    then
	icon="󰂀"
    elif [ "$per" -gt "50" ]
    then
	icon="󰁿"
    elif [ "$per" -gt "40" ]
    then
	icon="󰁾"
    elif [ "$per" -gt "30" ]
    then
	icon="󰁽"
    elif [ "$per" -gt "20" ]
    then
	icon="󰁻"
    elif [ "$per" -gt "10" ]
    then
	icon="󰁺"
    elif [ "$per" -gt "0" ]
    then
	icon="󰂃"
    else
	echo 󰂃 && exit
    fi
    echo $icon
}

percent(){
    echo $per
}


[ "$1" = "icon" ] && icon && exit
[ "$1" = "percent" ] && percent && exit
[ "$1" = "status" ] && batstat && exit
exit
