# color support for ls and grep
alias grep='grep --color=auto'

# killz <program name> -- Kills all programs with the given program name
alias killz='killall -9 '

# Make file manipulation verbose
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

# What else would you use ps for
alias psg="ps aux | grep"

# Enable "up" for previous commands
alias coin='rlwrap coin'

# Invoke gcc with commonly used options
alias cc='gcc -Wall -W -ansi -pedantic -O2 '

# Show all leaks
alias valgrind-leak='valgrind --leak-check=full --show-reachable=yes'

# Shortand ls options
alias l='ls'
alias la='ls -a'
alias ll='ls -lh'
alias lal='ls -alh'
alias lla='lal'
alias lh='ls -d .*'
alias lhl='ls -lhd .*'
alias llh='lhl'

# Moving around
alias cdd="cd ../"
alias cddd="cd ../../"
alias cdddd="cd ../../../"
alias cddddd="cd ../../../../"
alias cdddddd="cd ../../../../../"
alias cddddddd="cd ../../../../../../"
alias cdddddddd="cd ../../../../../../../"
alias cdddddddd="cd ../../../../../../../../"
alias back="cd -"

# Alternate navigation scheme
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias .......="cd ../../../../../../"
alias ........="cd ../../../../../../../"
alias ........="cd ../../../../../../../../"

# General use stuff
alias vi="vim"
alias vvim="command vim"

alias tmux="tmux -2"

alias ga="git add"
alias gb="git branch"
alias gc="git commit -v"
alias gd="git diff"
alias gm="git merge"
alias gp="git push"
alias gpl="git pull"
alias gl="git log"
alias gst="git status"
