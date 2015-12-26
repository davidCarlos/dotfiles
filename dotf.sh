#!/bin/bash
. ./messages.sh
DF_DIR=$(pwd)
BKPDIR=~/.dotf_bkps/
WILL_UPDATE=0


actions=("help" "install" "clean" "restore")

action=$1
target=$2


if [[ $action == "help" ]]; then
  _help_msg
fi

if [[ -d $target ]]; then
   chmod u+x $target/$target'.sh'
  ./$target/$target'.sh' $action
fi


# This functions is executed by the dotfile scripts.
# The variables that are called in the functions , and are not defined here,
# are defined in dotfile scripts, that calls the function

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
    create_bkp_msg "$bkp"
    mkdir -p  "$bkp" > /dev/null
}

sample_restore()
{
    sample_restore_msg $app

    sudo rm -rf ~/."$app"/

    if [[ ! -e $bkp/."$dotfile" ]]; then
        rm $HOME/.$dotfile
    else
      mv $bkp/.$dotfile "$HOME"/
    fi

    mv $bkp/.$app/ "$HOME"/
}
