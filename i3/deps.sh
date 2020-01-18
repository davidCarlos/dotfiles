#!/bin/bash
apt update && apt install rofi compton dzen2 scrot i3lock-fancy lxappearance

# fonts
git clone https://github.com/stark/siji

# i3-extras
pip install i3-py
git clone git@github.com:ashinkarov/i3-extras.git

# rofi themes
mkdir ~/.config/rofi/
git clone git@github.com:davatorium/rofi-themes.git && (cd rofi-themes/Official\ Themes && cp gruvbox-common.inc ~/.config/rofi/gruvbox-common.inc.rasi && cp gruvbox-dark.rasi ~/.config/rofi/)
