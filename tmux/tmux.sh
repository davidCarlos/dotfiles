#!/bin/bash
. ./dotf.sh
. ./messages.sh

app=tmux
bkp=$BKPDIR/$app/
path=$DF_DIR/$app/
dotfile=tmux.conf

install()
{
    install_dependencies_msg
    install_dependencies

    config_files_msg
    if [[  -e $HOME/.$dotfile ]]; then
        mv "$HOME"/.$dotfile "$bkp"
    fi
    ln -f "$path"/$dotfile "$HOME"/.$dotfile

}

install_dependencies()
{
    which tmux

    if [[ ! $? -eq 0 ]]; then
        sudo apt-get install tmux
    fi
}

create_bkp "$bkp"
manage_action "$1"
