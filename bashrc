#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vim='nvim'
PS1=' \e[0;33m[\e[m\e[1;32m\u\e[m\e[0;33m:\e[m\e[1;34m\w\e[m\e[0;33m]\e[m\e[0;32m\n\$\e[m '

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
