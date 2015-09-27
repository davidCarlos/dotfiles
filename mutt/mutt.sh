#!/bin/bash
. ./dotf.sh
app=mutt
bkp=$BKPDIR/$app/
path=$DF_DIR/$app/
dotfile=muttrc

install()
{

    install_dependencies 

    config_files_msg

    local dotfiles=(mail_aliases_crypto muttrc mypwd.gpg sidebar signature)

    for file in "${dotfiles[@]}"
    do
        ln -f $path/$file "$HOME"/.$app/$file
    done
}

install_dependencies()
{
    install_dependencies_msg

    update
    sudo apt-get install mutt-patched
    git clone git@github.com:altercation/mutt-colors-solarized.git ~/.$app/mutt-colors-solarized
    ( cd $HOME/.$app/mutt-colors-solarized && ./mutt-compile-colors.sh)
}

create_bkp "$bkp"
manage_action "$1"
