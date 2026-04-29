CONFIG="~/.config/rofi/power/config.rasi"

LOGOUT="  logout"
REBOOT="󰦛  reboot"
SHUTDOWN="  shutdown"

layout=$(echo -e "$LOGOUT\n$REBOOT\n$SHUTDOWN" | rofi -dmenu -config $CONFIG)

if [ "$layout" = "$LOGOUT" ]; then
    i3-msg exit
elif [ $"$layout" = "$REBOOT" ]; then
    reboot
elif [ "$layout" = "$SHUTDOWN" ]; then
    shutdown now
fi
