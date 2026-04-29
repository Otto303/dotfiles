#!/bin/sh

BAT_LVL=$(cat /sys/class/power_supply/BAT1/capacity)
BAT_STATUS=$(cat /sys/class/power_supply/BAT1/status)

function low()
{
    while true; do
        while [ $BAT_LVL -gt 20 ]; do
            BAT_LVL=$(cat /sys/class/power_supply/BAT1/capacity)
            sleep 1
        done
        notify-send "󰁻 Battery Low" "Please charge now."
        while [ $BAT_LVL -le 20 ]; do
            BAT_LVL=$(cat /sys/class/power_supply/BAT1/capacity)
            sleep 1
        done
    done
}

function charging()
{
    while true; do
        while [ $BAT_STATUS != "Charging" ]; do
            BAT_STATUS=$(cat /sys/class/power_supply/BAT1/status)
            sleep 1
        done
        notify-send "󰢝 Battery charging."
        while [ $BAT_STATUS != "Discharging" ]; do
            BAT_STATUS=$(cat /sys/class/power_supply/BAT1/status)
            sleep 1
        done
        notify-send "󰁾 Battery discharging."
    done
}

low &
charging &
