#!/usr/bin/env sh

# color support for ls and grep
alias grep='grep --color=auto'

# Make file manipulation verbose
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

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
alias cdd='cd ../'
alias cddd='cd ../../'
alias cdddd='cd ../../../'
alias cddddd='cd ../../../../'
alias cdddddd='cd ../../../../../'
alias cddddddd='cd ../../../../../../'
alias cdddddddd='cd ../../../../../../../'
alias cdddddddd='cd ../../../../../../../../'
alias back='cd -'

# Alternate navigation scheme
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias ........='cd ../../../../../../../../'

# General use stuff
alias vi='vim'

alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gd='git diff'
alias gm='git merge'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --stat'
alias gst='git status'

# color support for ls and grep
if [[ "$OSTYPE" == "darwin"* ]] || [[ "$OSTYPE" == "freebsd"* ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

if ! exists_command 'ghci' && exists_command 'stack'; then
  alias ghci='stack exec ghci'
fi

if ! exists_command 'ghc' && exists_command 'stack'; then
  alias ghc='stack exec ghc'
fi

rlwrap_wrapper 'sml'

# Shortand ls options
if exists_command 'exa'; then
  alias ls='exa'
  alias tree='exa -T'
fi

# General use stuff
if exists_command 'nvim'; then
  alias vim='nvim'
fi

alias edit='$EDITOR'

# Open things in WSL
if exists_command 'cmd.exe'; then
  open() {
    echo "$@" | sed 's/\/mnt\/\(.\)/\1:/1' | xargs cmd.exe /C start
  }
fi

if exists_command 'python3'; then
  alias python='python3'
fi

