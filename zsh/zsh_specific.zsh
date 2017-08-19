# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Add fuzzy matching to completion
# From http://superuser.com/a/815317
zstyle ':completion:*' matcher-list '' \
	'm:{a-z\-}={A-Z\_}' \
	'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
	'r:|?=** m:{a-z\-}={A-Z\_}'

if [[ "$OSTYPE" == "darwin"* ]]; then
	test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

# Autocomplete hidden files
setopt globdots

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
