# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Fix colors
export TERM=xterm-256color

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export RANGER_LOAD_DEFAULT_RC=FALSE

# Fix weird formatting issues
export LC_ALL="en_US.UTF-8"
export LANG=en_US.UTF-8

export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/

# Fix vim ctrl+s to save
stty -ixon

if [[ "$OSTYPE" == "darwin"* ]]; then
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

set -o ignoreeof

# Add fuzzy matching to completion
# From http://superuser.com/a/815317
zstyle ':completion:*' matcher-list '' \
    'm:{a-z\-}={A-Z\_}' \
    'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
    'r:|?=** m:{a-z\-}={A-Z\_}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
