#!/bin/sh
CONFIG=$HOME/.config/rofi/configs/wallpaper.rasi
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

rofi -show filebrowser \
     -show-icons \
     -filebrowser-directory "$WALLPAPER_DIR" \
     -filebrowser-command "$HOME/.config/scripts/change_wallpaper.sh" \
     -theme "$CONFIG"
