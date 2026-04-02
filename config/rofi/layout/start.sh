NAME=layout
PWD=~/.config/rofi/$NAME

rofi -show $NAME -modes "${NAME}:${PWD}/options.sh" -config "${PWD}/config.rasi"
