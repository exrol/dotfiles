# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '
