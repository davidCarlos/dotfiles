#!/bin/bash
DF_DIR=$(pwd)

_help()
{
    echo "================================================================="
    echo "./dotf.sh install {dotf}       Installs only {dotf}"
    echo "./dotf.sh clean {dotf}         cleans from machine only {dotf}"
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

