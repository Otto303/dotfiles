EU="qwerty"
FR="azerty"
BRE="c'hwerty"

layout=$(echo -e "$EU\n$FR\n$BRE" | rofi -dmenu -p "  ")
current=$(setxkbmap -query | awk '/layout|variant/ {print $2}' | xargs)

if [ "$layout" = "" ]; then
    exit
elif [ "$layout" = "$EU" ]; then
    target="eu"
elif [ $"$layout" = "$FR" ]; then
    target="fr"
elif [ "$layout" = "c'hwerty" ]; then
    target="fr bre"
fi

if [ "$target" != "$current" ]; then
    setxkbmap $target
    notify-send "Layout" "Changed to $layout"
fi
