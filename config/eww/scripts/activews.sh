#!/bin/bash

ws=$(hyprctl activeworkspace | grep 'workspace ID' | awk -F '[()]' '{print $2}')

exit $((ws))
