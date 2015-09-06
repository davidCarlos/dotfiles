#!/bin/bash
. ./dotf.sh

path=$DF_DIR/bash/
create_bkp()
{
    mkdir ~/.dotf_bkps/bash/
}

manage_action()
{
    action=$1
    if [[ $action == 'install' ]]; then
      install
      echo "ok"
    fi
}

install()
{
    if [[  -e $HOME/.bashrc ]]; then
        cp "$HOME"/.bashrc "$HOME"/.bashrc'_bkp'
    fi
    ln -f $path/bashrc "$HOME"/.bashrc

    mkdir ~/.bash > /dev/null
    ln -f $path/aliases ~/.bash/aliases
    ln -f $path/colors ~/.bash/colors
}

manage_action "$1"
