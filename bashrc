# .bashrc

export TERM=xterm-256color
alias tmux='TERM=xterm-256color tmux'
alias vim='nvim'
alias t='/bin/bash /home/davidcarlos/projects/todo.txt_cli-2.10/todo.sh -d ~/.todo-txt/config'

# Source global definitions
    if [ -f /etc/bashrc ]; then
        . /etc/bashrc
    fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions


# Created by newuser for 5.2
export TERM=xterm-256color
alias tmux='TERM=xterm-256color tmux'
alias vim='nvim'
alias t='/bin/bash /home/davidcarlos/projects/todo.txt_cli-2.10/todo.sh -d ~/.todo-txt/config'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH=$PATH:$HOME/.rvm/bin

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
export PS1="\[\e[33m\][\u${RESET} ${GREEN}\W]${RESET}\$(parse_git_branch)\[\033[00m\]\n$ "

export EDITOR=nvim
export GOPATH="/home/davidcarlos/projects/go"
#alias npm="/home/davidcarlos/projects/node/bin/npm"
alias acervos_api_docker="docker run -it -p 4040:4040 -v ~/projects/pencillabs/acervos-api/:/src/acervos-api/acervos-api acervos_api_docker"
alias noosfero_docker="docker run -i -t -p 3000:3000 -v ~/projects/noosfero:/src/noosfero noosfero"
alias night_mode="redshift -r -O 3300 -b 0.9"

NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
