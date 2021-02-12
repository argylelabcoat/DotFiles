#!/bin/sh
color=$1
alacritty=${HOME}/.config/alacritty
cat ${alacritty}/alacritty-base.yml ${alacritty}/colors/${color}.yml > ${alacritty}/alacritty.yml
