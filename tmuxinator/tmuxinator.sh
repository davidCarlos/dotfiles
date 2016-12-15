#!/bin/bash
. ./dotf.sh
. ./messages.sh
app=tmuxinator
bkp=$BKPDIR/$app/
path=$DF_DIR/$app/
dotfiles=(dev2_env.yml dev_env.yml web.yml)

install()
{
    config_files_msg $app

    install_tmuxinator

    if [[ -d $HOME/.$app ]]; then
        mv "$HOME"/.$app $bkp/ > /dev/null
    fi

    mkdir -p "$HOME"/.$app/ > /dev/null

    for file in "${dotfiles[@]}"
    do
        ln -f $path/$file "$HOME"/.$app/$file
    done
}

install_tmuxinator()
{
    install_dependencies_msg $app

    which tmux


    if [[ ! $? -eq 0 ]]; then
      echo "You need to install tmux, to use tmuxinator"
      return 1
    fi

    which ruby

    if [[ 0 -eq $? ]]; then
        sudo gem install tmuxinator
    else
        echo "Missing ruby"
        echo "Do you want we install it for you[y|N]?"
        read opt
        if [[ $opt == 'y' ]]; then
          sudo apt install ruby
          sudo gem install tmuxinator
        fi
    fi
}

copy_envs()
{
    ln -s 
}
sample_restore()
{
    sample_restore_msg $app
    sudo rm -rf ~/.$app/
    sudo gem uninstall tmuxinator
    mv $bkp/.$app/ "$HOME"/
}

create_bkp $bkp
manage_action $1
