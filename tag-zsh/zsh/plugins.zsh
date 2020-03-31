if ! exists_directory "$HOME/.zplug"; then
  echo "Auto-installing zplug"
  git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "lib/clipboard", from:oh-my-zsh

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
