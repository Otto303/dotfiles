#!/usr/bin/sh
PWD=~/.config/rofi/$NAME

if [ x"$@" = x"  logout" ]; then
    i3-msg exit
elif [ x$"$@" = x"󰦛  reboot" ]; then
    reboot
elif [ x"$@" = x"  shutdown" ]; then
    shutdown now
fi

echo "  logout"
echo "󰦛  reboot"
echo "  shutdown"
