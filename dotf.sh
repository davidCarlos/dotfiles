#!/bin/bash
. ./messages.sh
DF_DIR=$(pwd)
BKPDIR=~/.dotf_bkps/
WILL_UPDATE=0

args=("$@")
action="${args[0]}"

call_dotfile_script()
{
    i="1"
    while [[  ! -z "${args[i]// }"  ]]; do
        local _dotfile=${args[i]}
        if [[ -d $_dotfile ]]; then
            chmod u+x $_dotfile/$_dotfile'.sh'
            ./$_dotfile/$_dotfile'.sh' $action &
        fi
        i=$[$i + 1]
    done
}

if [[ $action == "help" ]]; then
    _help_msg
else
    call_dotfile_script
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
    local _action=$1

    case $_action in
        'install')
            install ;;
        'restore')
            sample_restore ;;
    esac
}

create_bkp()
{
    local _bkp=$1
    create_bkp_msg "$_bkp"
    mkdir -p  "$_bkp" > /dev/null
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
