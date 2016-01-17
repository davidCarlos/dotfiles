#!/bin/bash
. ./dotf.sh
. ./messages.sh

app=bash
bkp=$BKPDIR/$app/
path=$DF_DIR/$app/
dotfile=bashrc

install()
{
    config_files_msg
    if [[  -e $HOME/.$dotfile ]]; then
        mv "$HOME"/.$dotfile "$bkp"
    fi
    ln -f "$path"/$dotfile "$HOME"/.$dotfile

    mkdir ~/.$app > /dev/null
    ln -f "$path"/aliases ~/.$app/aliases
    ln -f "$path"/colors ~/.$app/colors
}

create_bkp "$bkp"
manage_action "$1"
bash_source_msg
