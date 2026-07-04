theme_list=$(ls -1 $HOME/.config/themes)

theme=$(echo -e "$theme_list" | rofi -dmenu -p "󰔎 ")

if [ "$theme" = "" ]; then
    exit
fi

replace ()
{
    rm $HOME/.config/$1

    file=$HOME/.config/themes/$theme/$1
    if ! [ -f $file ] ; then
        file=$HOME/.config/themes/default/$1
    fi
    ln -s $file $HOME/.config/$1
}

# i3 conf
replace i3/visuals.conf && i3-msg reload

# alacritty
replace alacritty/style.toml

# rofi
replace rofi/config.rasi
replace rofi/dmenu.rasi

# polybar
replace rofi/colors.rasi
replace polybar/settings.ini
replace polybar/config.ini

pkill polybar
polybar -c $HOME/.config/polybar/config.ini top || true
polybar -c $HOME/.config/polybar/config.ini bottom || true
