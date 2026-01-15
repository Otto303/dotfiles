#!/bin/sh

# aiplane mode
AP=''

# wifi
WIFI=''
if [[ $AP = '' ]]; then
    SSID=$(iwgetid -r)
    if [[ -n $SSID ]]; then
        WIFI="󰤢  "
    else
        WIFI="󰤭  "
    fi
fi

# bluetooth
BLUETOOTH=""

# volume
VOL="  "

# battery
BAT_ICON=""
BAT_LVL=$(cat /sys/class/power_supply/BAT1/capacity)

if [[ $(cat /sys/class/power_supply/ADP1/online) == 1 ]]; then
	BAT_ICON="󰂊"
elif (( $BAT_LVL >= 95 )); then
    BAT_ICON="󰁹"
elif (( $BAT_LVL >= 80 )); then
    BAT_ICON="󰂀"
elif (( $BAT_LVL <= 20 )); then
    BAT_ICON="󰁻"
    notify-send 'Low battery' 'Please charge now'
else
	BAT_ICON="󰁾"
fi

BAT="${BAT_ICON} ${BAT_LVL}%"

# final
echo "$AP$WIFI$BLUETOOTH$VOL$BAT"
