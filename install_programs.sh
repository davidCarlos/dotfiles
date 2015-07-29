#!/bin/bash

# Debug flag
set -x


control_packages_install()
{
  which sudo

  #if sudo is installed, use it, otherwise use su -c.
  if [ 0 -eq $? ]; then
    apt_get_install 'sudo'
  else
    apt_get_install 'su -c'
  fi
}

programs=(git mutt irssi tmux vim.nox sudo)

# Receives sudo or su -c from control_install
apt_get_install()
{
    $1 apt-get update

    for program in ${programs[@]}
    do
        # which returns 0 if $program exists.
        which $program

        # If $program not exists, apt-get install  $program.
        if [ ! 0 -eq $? ]; then
          $1 apt-get install -y $program
        fi
    done
}

clone_repositories()
{

  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  # config mutt's colorscheme
  git clone git@github.com:altercation/mutt-colors-solarized.git ~/.mutt/mutt-colors-solarized
  ( cd $HOME/.mutt/mutt-colors-solarized && ./mutt-compile-colors.sh)

  # install vim plugins
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim -c BundleInstall

}
