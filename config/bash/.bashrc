# If not running interactively, don't do anything
[[ $- == *i* ]] || return
[[ -f /etc/bash_completion ]] && . /etc/bash_completion
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_functions ]] && . ~/.bash_functions
[[ -f ~/.bash_shopt ]] && . ~/.bash_shopt
[ -n "$PS1" ] && source ~/.bash_profile;