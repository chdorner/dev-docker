HISTCONTROL=erasedups
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

shopt -s checkwinsize

PS1="${debian_chroot:+($debian_chroot)}\\u@machine:\\w\$ "

export EDITOR="vim"
export TERM="screen-256color"

alias tmux="tmux -2"
