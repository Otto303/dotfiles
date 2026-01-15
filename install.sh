#!/bin/sh

for pkg in $($PWD/pkgs.sh); do
    sudo pacman -Sy $pkg
done
