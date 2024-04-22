#!/bin/bash

ewwStatus="$(eww active-windows | grep 'dateWindow')"

if [ "$ewwStatus" == "dateWindow: dateWindow" ]
then
    eww close dateWindow
else
    eww open dateWindow &
fi

exit
