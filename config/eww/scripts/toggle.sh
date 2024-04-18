#!/bin/bash

ewwStatus="$(eww active-windows)"

if [ $ewwStatus != "dateWindow: dateWindow" ]
then
    eww open dateWindow &
else
    eww close-all
fi

exit
