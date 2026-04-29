EU="qwerty"
FR="azerty"
BRE="c'hwerty"

layout=$(echo -e "$EU\n$FR\n$BRE" | rofi -dmenu -p "  ")

if [ "$layout" = "" ]; then
    exit
elif [ "$layout" = "$EU" ]; then
    setxkbmap eu
elif [ $"$layout" = "$FR" ]; then
    setxkbmap fr
elif [ "$layout" = "c'hwerty" ]; then
    setxkbmap fr -variant bre
fi

notify-send "Layout" "Changed to $layout"
