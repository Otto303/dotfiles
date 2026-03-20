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

# Oh my zsh
echo -e '\e[0;1mInstalling Oh-my-zsh...\e[0;0m'

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

chsh -s /usr/bin/zsh

echo -e "\e[0;1m[\e[32;1mOK\e[0;1m] Oh-my-zsh\e[0;0m"

# Desktop
echo -e '\e[0;1mGenerating desktop...\e[0;0m'

mkdir -p $HOME/afs
mkdir -p $HOME/Documents
mkdir -p $HOME/Downloads
mkdir -p $HOME/Pictures
mkdir -p $HOME/Desktop
cp -r $PWD/wallpapers ~/Pictures/wallpapers

echo -e "\e[0;1m[\e[32;1mOK\e[0;1m] Desktop\e[0;0m"

echo -e "\e[0;1mDone.\e[0;0m"

# Done.
