#!/bin/bash
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
    ln -f bashrc "$HOME"/.bashrc
}

manage_action "$1"
