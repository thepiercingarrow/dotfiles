#!/bin/bash

mkdir -p src/

cp ~/.bashrc ~/.bash_profile ~/.inputrc src/
cp ~/.xinitrc ~/.gitconfig ~/.emacs src/

cp -r ~/.suckless src/.suckless

mkdir -p src/etc/
cp /etc/pacman.conf src/etc

mkdir -p src/.config/
cp -r ~/.config/dunst ~/.config/git src/.config
