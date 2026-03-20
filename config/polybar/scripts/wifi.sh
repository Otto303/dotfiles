#!/bin/sh

if [[ $1 == "on" ]]; then
    nmcli radio wifi on
    notify-send " 󰤥  Wifi enabled"
elif [[ $1 == "off" ]]; then
    nmcli radio wifi off
    notify-send " 󰤭  Wifi disabled"
else
    notify-send "Wifi" "Unkown command."
fi
