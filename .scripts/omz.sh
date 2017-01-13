# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Ugly, disgusting hack (Part 1)
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  ZSH_THEME="pure"
fi

# Ugly, disgusting hack (Part 2)
if [[ "$OSTYPE" == "darwin"* ]]; then
  autoload -U promptinit; promptinit
  prompt pure

  export PATH="/Users/Thejas/cc0/bin:$PATH"
fi

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git colored-man-pages command-not-found cp zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
