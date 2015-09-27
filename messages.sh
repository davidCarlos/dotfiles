#!/bin/bash

config_files_msg()
{
    local app=$1
    echo "============================================================"
    echo " Putting $app config files in the correct places  "
    echo "============================================================"
    sleep 4
}

clone_repositories_msg()
{
    echo "============================================================"
    echo " Cloning $app necessary repositories "
    echo "============================================================"
    sleep 4
}

install_dependencies_msg()
{
    echo "============================================================"
    echo " Installing $app  dependencies "
    echo "============================================================"
    sleep 4
}

bash_source_msg()
{
    echo "============================================================"
    echo "Please, source your new bashrc"
    printf "command: source ~/.bashrc \n"
    printf "If you don't like the new look of your shell, \n
    change the current bashrc file  by the bashrc_bkp file. \n"
    echo "============================================================"
    sleep 4
}

_help_msg()
{
    echo "================================================================="
    echo "./dotf.sh install {dotf}       Installs only {dotf}"
    echo "./dotf.sh restore {dotf}         cleans from machine only {dotf}"
    echo "================================================================="
}

sample_restore_msg()
{
    local app=$1
    echo "================================================================="
    echo "Restoring your $app files"
    echo "================================================================="
    sleep 4
}

create_bkp_msg()
{
    local app=$1
    echo "================================================================="
    echo "Creating $app bkp folder inside ~/.dotf_bkps"
    echo "================================================================="
    sleep 4
}
