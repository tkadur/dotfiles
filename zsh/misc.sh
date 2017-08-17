# Fix colors
export TERM=xterm-256color

# Fix vim ctrl+s to save
stty -ixon

if [[ "$OSTYPE" == "darwin"* ]]; then
	export RUST_SRC_PATH=~/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src/
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
