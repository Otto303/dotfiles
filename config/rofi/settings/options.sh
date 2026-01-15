#!/usr/bin/sh
PWD=~/.config/rofi/settings

if [ x"$@" = x" " ]; then
    ($PWD/wifi/start.sh > /dev/null) & disown & exit
elif [ x"$@" = x"󰂯" ]; then
	exit
elif [ x"$@" = x"󰀝" ]; then
	exit
elif [ x"$@" = x" " ]; then
    exit
elif [ x"$@" = x" " ]; then
    exit
fi

echo " "
echo "󰂯"
echo "󰀝"
echo " "
echo " "
