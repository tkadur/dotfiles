# color support for ls and grep
alias grep='grep --color=auto'
if [[ `uname` = "Darwin" || `uname` = "FreeBSD" ]]; then
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

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias 150="cd ~/Google\ Drive/CMU/S17/15-150/"
  alias trash="cd ~/.Trash"
  alias 150hw="cd ~/Google\ Drive/CMU/S17/15-150/hw"
fi

# See how much RAM Chrome is using (always helpful)
alias chromemem="ps -ev | grep -i chrome | awk '{print \$12}' | awk '{for(i=1;i<=NF;i++)s+=\$i}END{print s}'"
alias chromemem="echo 'Chrome is using $(chromemem)% of memory.'"


# General use stuff
alias mine="sudo chown $(whoami)"
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias vim="mvim -v"
  alias vi="mvim -v"
else
  alias vi="vim"
fi

alias pyserver="python -m SimpleHTTPServer"

# Open manpages in vim
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}

# Open i3 config file
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias i3config="vim ~/.config/i3/config"
fi

# Syncing data with Andrew servers
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias sync-from-andrew='rsync -avz -e ssh --progress andrew:~/private "/Users/Thejas/Google Drive/CMU/andrew_server/"'
  alias sync-from-andrew-dry-run='rsync --dry-run -avz -e ssh --progress andrew:~/private "/Users/Thejas/Google Drive/CMU/andrew_server"'
  alias sync-to-andrew='rsync -avz -e ssh --progress "/Users/Thejas/Google Drive/CMU/andrew_server/private" andrew:~'
  alias sync-to-andrew-dry-run='rsync --dry-run -avz -e ssh --progress "/Users/Thejas/Google Drive/CMU/andrew_server/private" andrew:~'
fi
