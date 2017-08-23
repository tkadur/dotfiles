# Bash-it config
load_module ~/.bash/bash-it.bash

if [[ "$OSTYPE" == "darwin"* ]]; then
	test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
	[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
