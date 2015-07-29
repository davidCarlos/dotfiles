#!/bin/bash

#Debug flag
set -x

files=(irssi_conf vimrc muttrc bashrc tmux.conf)

if [[ ! -d $HOME/.mutt ]]; then
    mkdir $HOME/.mutt $HOME/.cache/mutt/
fi

if [[ ! -d $HOME/.tmux ]]; then
    mkdir $HOME/.tmux
fi

if [[ ! -d $HOME/.irssi ]]; then
    mkdir $HOME/.irssi
fi

put_files_in_correct_place()
{
    if [ "$1" = "tmux.conf" ]; then
        ln $1 $HOME/.$1
        return
    fi

    if [ "$1" = "irssi" ]; then
        ln $1 $HOME/.irssi/config
        return
    fi

    if [ "$1" = "muttrc" ]; then
        ln $1 $HOME/.mutt/$1
        # mail_aliases_crypto is a file with some alias to my mail contacts.
        # This is not useful to others users.
        ln mail_aliases_crypto $HOME/.mutt/mail_aliases_crypto
        return
    fi

    # useful to bashrc and vimrc
    if [[  -e $HOME/.$1 ]]; then
        cp $HOME/.$1 $HOME/.$1'_bkp'
    fi
        ln $1 $HOME/.$1
}

for file in ${files[@]}
do
    put_files_in_correct_place $file
done

. install_programs.sh

control_packages_install
clone_repositories
