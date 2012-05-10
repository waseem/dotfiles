#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

PS1='\e[0;35m\u@\h\e[m: \e[0;34m\w\e[m\e[0;32m$(__git_ps1)\e[m:\n\$ '


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
