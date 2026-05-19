CONFIG="~/.config/rofi/power/config.rasi"

LOGOUT="  logout"
REBOOT="󰦛  reboot"
SHUTDOWN="  shutdown"

CONFIRM="$HOME/.config/rofi/confirm/start.sh"

layout=$(echo -e "$LOGOUT\n$REBOOT\n$SHUTDOWN" | rofi -dmenu -config $CONFIG)

if [ "$layout" = "$LOGOUT" ]; then
    $CONFIRM i3-msg exit
elif [ $"$layout" = "$REBOOT" ]; then
    $CONFIRM reboot
elif [ "$layout" = "$SHUTDOWN" ]; then
    $CONFIRM shutdown now
fi
