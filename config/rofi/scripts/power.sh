CONFIG="~/.config/rofi/configs/power.rasi"

LOGOUT=""
REBOOT="󰦛"
SHUTDOWN=""

CONFIRM="$HOME/.config/rofi/scripts/confirm.sh"

layout=$(echo -e "$LOGOUT\n$REBOOT\n$SHUTDOWN" | rofi -dmenu -config $CONFIG)

if [ "$layout" = "$LOGOUT" ]; then
    $CONFIRM i3-msg exit
elif [ $"$layout" = "$REBOOT" ]; then
    $CONFIRM reboot
elif [ "$layout" = "$SHUTDOWN" ]; then
    $CONFIRM shutdown now
fi
