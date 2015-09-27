#!/bin/bash
. ./dotf.sh
local app=vim
local bkp=$BKPDIR/$app/
local path=$DF_DIR/$app/
local dotfile=vimrc

install()
{
    if [[ -d $HOME/.$app/ ]]; then
        mv "$HOME"/.$app/ $bkp > /dev/null
    fi

    if [[  -e $HOME/.$dotfile ]]; then
        mv "$HOME"/.$dotfile $bkp > /dev/null
    fi

    install_dependencies

    ln -f $path/$dotfile "$HOME"/.$dotfile
    local user=$(whoami)
    sudo chown -R $user:$user ~/.$app/
    
    vim -c BundleInstall -c q -c q
}



install_dependencies()
{
    update
    sudo apt-get install silversearcher-ag exuberant-ctags vim-nox -y
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.$app/bundle/Vundle.vim
}

create_bkp "$bkp"
manage_action "$1"
