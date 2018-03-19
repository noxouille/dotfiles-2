#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1="\[\033[0;37m\][\[\033[1;32m\]\u\[\033[0;33m\]:\[\033[1;34m\]\w\]\033[0;37m\]]\[\033[0;32m\]$ \[\033[0;37m\]"

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
