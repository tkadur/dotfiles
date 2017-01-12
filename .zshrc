# load a module robustly by skipping all remaining modules if any module fails
# to load
load_module() {
  if [ -n "$ABORTED" ]; then
    return
  fi

  module="$1"
  if [ -f "$module" ]; then
    source $module

    if [ "$?" != "0" ]; then
      echo "Module $module failed to load. Exiting."
      export ABORTED=1
      return
    fi
  fi
}

# Guard against non-interactive logins
[ -z "$PS1" ] && return

load_module ~/.scripts/aliases.sh


# Syncing data with Andrew servers
#alias sync-from-andrew='rsync -avz -e ssh --progress andrew:~/private "/Users/Thejas/Google Drive/CMU/andrew_server/"'
#alias sync-from-andrew-dry-run='rsync --dry-run -avz -e ssh --progress andrew:~/private "/Users/Thejas/Google Drive/CMU/andrew_server"'
#alias sync-to-andrew='rsync -avz -e ssh --progress "/Users/Thejas/Google Drive/CMU/andrew_server/private" andrew:~'
#alias sync-to-andrew-dry-run='rsync --dry-run -avz -e ssh --progress "/Users/Thejas/Google Drive/CMU/andrew_server/private" andrew:~'


if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias i3config="vim ~/.config/i3/config"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Ugly, disgusting hack (Part 1)
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  ZSH_THEME="pure"
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git colored-man-pages command-not-found cp zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Ugly, disgusting hack (Part 2)
if [[ "$OSTYPE" == "darwin"* ]]; then
  autoload -U promptinit; promptinit
  prompt pure

  export PATH="/Users/Thejas/cc0/bin:$PATH"
fi

export RANGER_LOAD_DEFAULT_RC=FALSE

# Fix weird formatting issues
export LC_ALL="en_US.UTF-8"
export LANG=en_US.UTF-8
