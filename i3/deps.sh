#!/bin/bash
sudo dnf install rofi compton dzen2 scrot i3lock-fancy lxappearance polybar

# fonts
git clone https://github.com/stark/siji ~/projects/siji

# i3-extras
pip install i3-py
git clone git@github.com:ashinkarov/i3-extras.git ~/projects/i3-extras

# rofi themes
mkdir ~/.config/rofi/
git clone git@github.com:davatorium/rofi-themes.git ~/.config/rofi/rofi-themes && (cd ~/.config/rofi/rofi-themes/Official\ Themes && cp gruvbox-common.inc ~/.config/rofi/gruvbox-common.inc.rasi && cp gruvbox-dark.rasi ~/.config/rofi/)
