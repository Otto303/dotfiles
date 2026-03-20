#!/bin/sh

PWD=$HOME/.config/rofi/wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

rofi -show filebrowser \
     -show-icons \
     -filebrowser-directory "$WALLPAPER_DIR" \
     -filebrowser-command "feh --bg-fill" \
     -theme "$PWD/config.rasi"
