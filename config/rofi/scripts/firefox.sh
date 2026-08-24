#!/bin/sh

NEW="󰈹  new window"
PRIVATE="󰗹  new private window"

res=$(echo -e "$NEW\n$PRIVATE" | rofi -dmenu -p " ")

case "$res" in
    $NEW) firefox & disown
    ;;
    $PRIVATE) firefox --private-window & disown
    ;;
    *) exit
    ;;
esac
