#!/bin/bash
. ./dotf.sh
bkp=$BKPDIR/bash/

# DF_DIR is dotf.sh path
path=$DF_DIR/bash/
dotfile=bashrc

create_bkp()
{
    mkdir -p $bkp > /dev/null
}

manage_action()
{
    action=$1
    if [[ $action == 'install' ]]; then
      install
    fi
}

install()
{
    if [[  -e $HOME/.$dotfile ]]; then
        mv "$HOME"/.$dotfile $bkp
    fi
    ln -f $path/$dotfile "$HOME"/.$dotfile

}

install()
{
    if [[  -e $HOME/.$dotfile ]]; then
        mv "$HOME"/.$dotfile $bkp
    fi
    ln -f $path/$dotfile "$HOME"/.$dotfile

    mkdir ~/.bash > /dev/null
    ln -f $path/aliases ~/.bash/aliases
    ln -f $path/colors ~/.bash/colors
}

create_bkp
manage_action "$1"
