#!/bin/bash
. ./dotf.sh
. ./messages.sh

app=vim
bkp=$BKPDIR/$app/
path=$DF_DIR/$app/
dotfile=vimrc

install()
{
    create_bkp "$bkp"
    config_files_msg
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
    install_dependencies_msg $app
    update
    sudo apt-get install vim silversearcher-ag \ 
    exuberant-ctags vim-nox fonts-hack-ttf  -y

    clone_repositories_msg $app
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.$app/bundle/Vundle.vim
}

manage_action "$1"
