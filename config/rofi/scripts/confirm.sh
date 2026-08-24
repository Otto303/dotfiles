CONFIG="~/.config/rofi/configs/confirm.rasi"

res=$(echo -e "yes\nno" | rofi -dmenu -config $CONFIG -p "")

if [ "$res" = "yes" ]; then
    $@
fi
