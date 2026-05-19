CONFIG="~/.config/rofi/confirm/config.rasi"

res=$(echo -e "yes\nno" | rofi -dmenu -config $CONFIG -p "")

if [ "$res" = "yes" ]; then
    $@
fi
