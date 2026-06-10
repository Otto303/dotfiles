theme_list=$(ls -1 $HOME/.config/themes)

theme=$(echo -e "$theme_list" | rofi -dmenu -p "󰔎 ")

if [ "$theme" = "" ]; then
    exit
fi

replace ()
{
    rm $HOME/.config/$1
    ln -s $HOME/.config/themes/$theme/$1 $HOME/.config/$1
}

# i3 conf
replace i3/visuals.conf && i3-msg reload

# alacritty
replace alacritty/alacritty.toml

# polybar
replace rofi/colors.rasi
replace polybar/settings.ini
replace polybar/config.ini

pkill polybar
polybar -c $HOME/.config/polybar/config.ini top || true
polybar -c $HOME/.config/polybar/config.ini bottom || true
