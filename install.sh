#!/bin/sh

# Packages
echo -e '\e[0;1mInstalling packages...\e[0;0m'

for pkg in $($PWD/pkgs.sh); do
    sudo pacman -Sy $pkg --noconfirm > /dev/null
    echo -e "\e[0;1m[\e[32;1mOK\e[0;1m] $pkg\e[0;0m"
done

# Config
echo -e '\e[0;1mInstalling config files...\e[0;0m'

cp -rf $PWD/config/* ~/.config/
cp -rf $PWD/zshrc ~/.zshrc

echo -e "\e[0;1m[\e[32;1mOK\e[0;1m] Config files\e[0;0m"

# Desktop
echo -e '\e[0;1mGenerating desktop...\e[0;0m'

mkdir ~/afs
mkdir ~/Documents
mkdir ~/Downloads
mkdir ~/Pictures
cp $PWD/wallpapers ~/Pictures/wallpapers

echo -e "\e[0;1m[\e[32;1mOK\e[0;1m] Desktop\e[0;0m"

# Done.
