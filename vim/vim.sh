#!/bin/bash
. ./dotf.sh
bkp=$BKPDIR/vim/
path=$DF_DIR/vim/
dotfile=vimrc

manage_action()
{
    action=$1

    case $action in
      'install')
        install ;;
      'clean')
        clean ;;
    esac

}

create_bkp()
{
    mkdir $bkp > /dev/null
}

install()
{
    if [[ -d $HOME/.vim/ ]]; then
        mv "$HOME"/.vim/ $bkp > /dev/null
    fi

    if [[  -e $HOME/.$dotfile ]]; then
        mv "$HOME"/.$dotfile $bkp > /dev/null
    fi

    install_dependencies

    ln -f $path/$dotfile "$HOME"/.$dotfile
    user=$(whoami)
    sudo chown -R $user:$user ~/.vim/
    vim -c BundleInstall
}

restore()
{
    sudo rm -rf ~/.vim/

    if [[ ! -e $bkp/.$dotfile ]]; then
        rm $HOME/.$dotfile
    else
      mv $bkp/.$dotfile "$HOME"/
    fi

    mv $bkp/.vim/ "$HOME"/
}


install_dependencies()
{
    sudo apt-get update
    sudo apt-get install silversearcher-ag exuberant-ctags vim-nox -y
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

manage_action "$1"
