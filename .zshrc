# Created by newuser for 5.2

# We provide a few (useful) aliases and scripts for you to get started:

### cc <arguments to gcc> -- Invokes gcc with the flags you will usually use
### valgrind-leak <arguments to valgrind> -- Invokes valgrind in the mode to show all leaks
### hidden <arguments to ls> -- Displays ONLY the hidden files
### killz <program name> -- Kills all programs with the given program name
### shell -- Displays the name of the shell being used
### get_cs_afs_access -- Sets up cross-realm authentication with CS.CMU.EDU so you can access files stored there.

# More features may be added later as thought of or requested.


# ----- guard against non-interactive logins ---------------------------------
[ -z "$PS1" ] && return


# ----- convenient alias and function definitions ----------------------------

# color support for ls and grep
alias grep='grep --color=auto'
if [[ `uname` = "Darwin" || `uname` = "FreeBSD" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias killz='killall -9 '
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
alias shell='ps -p $$ -o comm='
alias sml='rlwrap sml'
alias math='rlwrap MathKernel'
alias coin='rlwrap coin'

alias cc='gcc -Wall -W -ansi -pedantic -O2 '
alias valgrind-leak='valgrind --leak-check=full --show-reachable=yes'

# End GPI additions

alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
alias lh='ls -d .*'
alias lhl='ls -ld .*'

alias cdd="cd ../"
alias cddd="cd ../../"
alias cdddd="cd ../../../"
alias cddddd="cd ../../../../"

alias cat="colorize"

alias back="cd -"

# Syncing data with Andrew servers
alias sync-from-andrew='rsync -avz -e ssh --progress andrew:~/private "/Users/Thejas/Google Drive/CMU/andrew_server/"'
alias sync-from-andrew-dry-run='rsync --dry-run -avz -e ssh --progress andrew:~/private "/Users/Thejas/Google Drive/CMU/andrew_server"'
alias sync-to-andrew='rsync -avz -e ssh --progress "/Users/Thejas/Google Drive/CMU/andrew_server/private" andrew:~'
alias sync-to-andrew-dry-run='rsync --dry-run -avz -e ssh --progress "/Users/Thejas/Google Drive/CMU/andrew_server/private" andrew:~'

vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/Thejas/.oh-my-zsh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize command-not-found cp osx vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

autoload -U promptinit; promptinit
prompt pure

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/Users/Thejas/cc0/bin:$PATH"
