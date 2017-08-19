# Bash-it config
load_module ~/.bash/bash-it.bash

if [[ "$OSTYPE" == "darwin"* ]]; then
	test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
