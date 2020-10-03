#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.git-prompt.sh ]] && . ~/.git-prompt.sh

PS1='\e[1;35m\u@\h\e[m: \e[1;34m\w\e[m\e[0;32m$(__git_ps1)\e[m:\n\$ '

[[ -f /usr/share/chruby/chruby.sh ]] && . /usr/share/chruby/chruby.sh
[[ -f /usr/share/chruby/auto.sh ]] && . /usr/share/chruby/auto.sh
[[ -f /usr/share/nvm/init-nvm.sh ]] && . /usr/share/nvm/init-nvm.sh
[[ -f /etc/profile.d/autojump.bash ]] && . /etc/profile.d/autojump.bash

# Ignore duplicate commands from bash history
export HISTCONTROL=ignoredups
# Load correct version of python
eval "$(pyenv init -)"

eval "$(direnv hook bash)"
