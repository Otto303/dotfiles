#!/bin/zsh
LAST_RESULT=$?

MSG=''
CURRENT_DIR='%40<...<%~%<<'

# COLORS
BASE_COLOR='#aa00ff'
ERROR_COLOR='#bb0000'
NIX_COLOR='#2266aa'
PYTHON_COLOR='#dddd00'
GIT_COLOR='#66bb00'

# SET UP COLOR
COLOR=$BASE_COLOR
if [ -n "$NIX_BUILD_TOP" ] || [ -n "$IN_NIX_SHELL" ]; then
    COLOR=$NIX_COLOR
    MSG="%F{$NIX_COLOR} %f "
elif [ -n "$VIRTUAL_ENV" ]; then
    COLOR=$PYTHON_COLOR
    MSG="%F{$PYTHON_COLOR} %f "
elif (git status); then
    COLOR=$GIT_COLOR
fi

if [ $LAST_RESULT -ne 0 ]; then
    COLOR=$ERROR_COLOR
    MSG="%F{$ERROR_COLOR}[ $LAST_RESULT]%f $MSG"
fi

# Zsh VCS
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats "%F{$GIT_COLOR} %b %m%u%c%f"

setopt PROMPT_SUBST

# Set up PROMPT
PROMPT_TOP="%F{$COLOR}╭─%f"
PROMPT_BOTTOM="%F{$COLOR}╰─%f"

PROMPT="$PROMPT_TOP $CURRENT_DIR $MSG${vcs_info_msg_0_}
$PROMPT_BOTTOM "

# Unset used variables
unset LAST_RESULT
unset MSG
unset CURRENT_DIR

unset COLOR
unset BASE_COLOR
unset ERROR_COLOR

unset NIX_COLOR
unset GIT_COLOR
unset PYTHON_COLOR

unset PROMPT_TOP
unset PROMPT_BOTTOM
