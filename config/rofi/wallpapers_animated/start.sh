#!/bin/sh

PWD=$HOME/.config/rofi/wallpapers_animated
WALLPAPER_DIR="$HOME/Pictures/WallpapersAnimated"
CONFIG=$HOME/.config/rofi/configs/wallpaper.rasi

rofi -show filebrowser \
     -show-icons \
     -filebrowser-directory "$WALLPAPER_DIR" \
     -filebrowser-command "$PWD/gifbg.sh" \
     -theme "$CONFIG"
