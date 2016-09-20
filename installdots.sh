#!/bin/bash

cp src/.bashrc src/.bash_profile src/.inputrc ~/
cp src/.xinitrc src/.gitconfig src/.emacs ~/

sudo cp src/etc/pacman.conf /etc/pacman.conf

mkdir -p ~/.config/
cp -r src/.config/dunst src/.config/git ~/.config/
