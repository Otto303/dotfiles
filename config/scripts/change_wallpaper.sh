#!/bin/sh

matugen image "$1" --source-color-index 0
feh --bg-fill "$1"

killall xwinwrap || true
