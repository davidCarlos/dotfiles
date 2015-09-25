#!/bin/bash
. ./dotf.sh
app=tmuxinator
bkp=$BKPDIR/$app/
path=$DF_DIR/$app/
dotfiles=(dev2_env.yml dev_env.yml web.yml)

install()
{
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
    which ruby

    if [[ 0 -eq $? ]]; then
        sudo gem install tmuxinator
    else
        echo "Missing ruby"
        echo "Do you want we install it for you[y|N]?"
        read opt
        if [[ $opt == 'y' ]]; then
          sudo apt-get install ruby
          sudo gem install tmuxinator
        fi
    fi
}

sample_restore()
{
    sudo rm -rf ~/.$app/
    sudo gem uninstall tmuxinator
    mv $bkp/.$app/ "$HOME"/
}

create_bkp $bkp
manage_action $1
