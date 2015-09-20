#!/bin/bash
. ./dotf.sh
bkp=$BKPDIR/vim/
path=$DF_DIR/vim/
dotfile=vimrc

create_bkp()
{
    mkdir $bkp > /dev/null
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

manage_action "$1"
