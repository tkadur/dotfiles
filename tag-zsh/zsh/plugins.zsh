ZPLUG_LOCK_PATH=$HOME/.zsh/.zplug.lock
if [[ ! -a "$HOME/.zplug" ]] && [[ ! -a $ZPLUG_LOCK_PATH ]]; then
  echo "Auto-installing zplug"
  touch $ZPLUG_LOCK_PATH
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  rm $ZPLUG_LOCK_PATH
fi

source ~/.zplug/init.zsh

# Pure theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Syntax highlighting
zplug "zdharma/fast-syntax-highlighting", from:github

# Press up for history search
zplug "zsh-users/zsh-history-substring-search", from:github
if [[ "$OSTYPE" == "darwin"* ]]; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
else
  bindkey '\eOA' history-substring-search-up
  bindkey '\eOB' history-substring-search-down
fi
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load
