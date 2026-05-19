killall xwinwrap; sleep 0.5

CMD="xwinwrap -ov -g 1600x900+0+0 -- mpv -wid WID --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings"

$CMD $1

echo "$CMD $1" > $HOME/.fehbg
