#!/bin/sh

layout=$(i3-msg -t get_tree | jq -r 'recurse(.nodes[];.nodes!=null)|select(.nodes[].focused).layout')

case "$layout" in
    "stacked") echo 
    ;;
    "tabbed") echo 
    ;;
    *) echo 
    ;;
esac
