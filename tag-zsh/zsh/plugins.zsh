ZPLUG_LOCK_PATH=$HOME/.zsh/.zplug.lock
if ! exists_directory "$HOME/.zplug" && ! exists_file $ZPLUG_LOCK_PATH; then
  echo "Auto-installing zplug"
  touch $ZPLUG_LOCK_PATH
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  rm $ZPLUG_LOCK_PATH
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Pure theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Syntax highlighting
zplug "zdharma/fast-syntax-highlighting", from:github

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load
