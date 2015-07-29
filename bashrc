# Reset
Color_Off="\[\033[0m\]"       # Text Reset
 
# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White
 
# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White
 
# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White
 
# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White
 
# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White
 
# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White
 
# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White
 
# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"
 

 if [ "$color_prompt" = yes ]; then

if [[ ${EUID} == 0 ]] ; then
    sq_color=$BRed
  else
      sq_color=$BRed
    fi
 S1='\[\e[1;32m\]${debian_chroot:+($debian_chroot)}\u::\[\e[m\]\[\e[1;31m\]\h:\[\e[1;33m\]{\w}\[\e[1;37m\] --> '
 else
 export PS1="$BWhite\342\224\214\342\224\200\[[\e[1;32m\]${debian_chroot:+($debian_chroot)}\u$sq_color\[\e[1;37m\]]::\[[\e[1;31m\]\h\[\e[1;37m\]]\[\e[1;33m\]\n$BWhite\342\224\224\342\224\200>\[[\e[1;37m\]\[\e[1;33m\]\w\[\e[1;37m\]] "
  unset sq_color
 fi
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias tmux="TERM=screen-256color-bce tmux"
alias mutt="TERM=screen-256color-bce mutt"
alias tmuxinator="TERM=screen-256color-bce tmuxinator"

# # Alias definitions.
# # You may want to put all your additions into a separate file like
# # ~/.bash_aliases, instead of adding them here directly.
# # See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
 if [ -f ~/.bash_aliases ]; then
     . ~/.bash_aliases
 fi
#
# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
#  sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi
 export PATH=$PATH:/home/david/bin
 #export TERM=xterm-256color
#### GIT && PS1
#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
 
#show current project and branch
#GIT_PS1_SHOWDIRTYSTATE=false

add_venv_info () {
  if [ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
    _OLD_VIRTUAL_PS1="$PS1"
    if [ "x" != x ] ; then
      PS1="$PS1"
    else
      if [ "`basename \"$VIRTUAL_ENV\"`" = "__" ] ; then
        # special case for Aspen magic directories
        # see http://www.zetadev.com/software/aspen/
 export PS1="$BWhite\342\224\214\342\224\200\[[\e[1;32m\]${debian_chroot:+($debian_chroot)}\"$VIRTUAL_ENV\"$sq_color\[\e[1;37m\]]::\[[\e[1;31m\]\h\[\e[1;37m\]]\[\e[1;33m\]\n$BWhite\342\224\224\342\224\200>\[[\e[1;37m\]\[\e[1;33m\]\w\[\e[1;37m\]] "
  unset sq_color
      elif [ "$VIRTUAL_ENV" != "" ]; then
 export PS1="$BWhite\342\224\214\342\224\200\[[\e[1;32m\]${debian_chroot:+($debian_chroot)}(`basename \"$VIRTUAL_ENV\"`)\$sq_color\[\e[1;37m\]]::\[[\e[1;31m\]\h\[\e[1;37m\]]\[\e[1;33m\]\n$BWhite\342\224\224\342\224\200>\[[\e[1;37m\]\[\e[1;33m\]\w\[\e[1;37m\]] "
      fi
    fi
    export PS1
  fi
}
PROMPT_COMMAND="$PROMPT_COMMAND add_venv_info"
export EDITOR="vim"
