#!/usr/bin/sh
PWD=~/.config/rofi/$NAMEc’h

if [ x"$@" = x"qwerty" ]; then
    setxkbmap eu
    exit
elif [ x$"$@" = x"azerty" ]; then
    setxkbmap fr
    exit
elif [ x"$@" = x"c'hwerty" ]; then
    setxkbmap fr -variant bre
    exit
fi

echo "qwerty"
echo "azerty"
echo "c'hwerty"
