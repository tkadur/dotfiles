# color support for ls and grep
alias grep='grep --color=auto'
if [[ "$OSTYPE" == "darwin"* ]] || [[ "$OSTYPE" == "freebsd"* ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

# killz <program name> -- Kills all programs with the given program name
alias killz='killall -9 '

# Make file manipulation verbose
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

# Print name of shell currently being used
alias shell='ps -p $$ -o comm='

# What else would you use ps for
alias psg="ps aux | grep"

# Git status
alias gst="git status"

# Enable "up" for previous commands
alias sml='rlwrap sml'
alias math='rlwrap MathKernel'
alias coin='rlwrap coin'

# Invoke gcc with commonly used options
alias cc='gcc -Wall -W -ansi -pedantic -O2 '

# Show all leaks
alias valgrind-leak='valgrind --leak-check=full --show-reachable=yes'

# Shortand ls options
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
alias lh='ls -d .*'
alias lhl='ls -ld .*'

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

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias trash="cd ~/.Trash"
fi

# See how much RAM Chrome is using (always helpful)
alias chromemem="ps -ev | grep -i chrome | awk '{print \$12}' | awk '{for(i=1;i<=NF;i++)s+=\$i}END{print s}'"
alias chromemem="echo 'Chrome is using $(chromemem)% of memory.'"

# General use stuff
alias mine="sudo chown $(whoami)"
if [ -x "$(command -v nvim)" ]; then
  alias vim="nvim"
fi
alias vi="vim"
alias vvim="\vim"

if [ -x "$(command -v mvim)" ]; then
  alias mvim="mvim -v"
fi

alias tmux="tmux -2"

alias pyserver="python -m SimpleHTTPServer"

# Open manpages in vim
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}
