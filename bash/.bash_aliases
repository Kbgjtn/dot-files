#!/usr/bin/env bash

# ~/.bash_profile

# set -o vi
# bind 'set show-mode-in-prompt on'
# bind 'set vi-ins-mode-string "I>"'
# bind 'set vi-cmd-mode-string "N>"'

export HISTFILE=~/.bash_history
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:bg:fg:history:clear"

export FCEDIT=nvim
export EDITOR=nvim

# append instead of overwrite
shopt -s histappend
PROMPT_COMMAND='history -a; history -c; history -r'

[[ -f ~/.bashrc ]] && . ~/.bashrc
