#!/bin/bash
DF_DIR=$(pwd)
BKPDIR=~/.dotf_bkps/
WILL_UPDATE=0


actions=("help" "install" "clean" "restore")

_help()
{
    echo "================================================================="
    echo "./dotf.sh install {dotf}       Installs only {dotf}"
    echo "./dotf.sh restore {dotf}         cleans from machine only {dotf}"
    echo "================================================================="
}

action=$1
target=$2


if [[ $action == "help" ]]; then
  _help
fi

if [[ -d $target ]]; then
  ./$target/$target'.sh' $action
fi


#This functions is executed by the dotfile scripts.
# manage_action, create_bkp
update()
{
    if [[ $WILL_UPDATE -eq 0 ]]; then
        sudo apt-get update
        WILL_UPDATE=1
    fi
}

manage_action()
{
    local action=$1

    case $action in
      'install')
        install ;;
      'restore')
        sample_restore ;;
    esac
}

create_bkp()
{
    local bkp=$1
    mkdir -p  $bkp > /dev/null
}

sample_restore()
{
    sudo rm -rf ~/.$app/

    if [[ ! -e $bkp/.$dotfile ]]; then
        rm $HOME/.$dotfile
    else
      mv $bkp/.$dotfile "$HOME"/
    fi

    mv $bkp/.$app/ "$HOME"/
}
