# Currently broken
# export ANTIGEN_CACHE=false
source $ANTIGEN_DIR/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    # Bundles from the default repo
    adb
    history-substring-search

    sorin-ionescu/prezto modules/completion

    zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen theme refined

antigen apply
