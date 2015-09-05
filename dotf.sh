#!/bin/bash   

action=$1
target=$2

if [[ -d $target ]]; then
  ./$target/$target'.sh' $action
fi
