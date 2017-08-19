# Fix colors
export TERM=xterm-256color

# Fix vim ctrl+s to save
stty -ixon

# Show file previews in fzf
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

if [[ "$OSTYPE" == "darwin"* ]]; then
	export RUST_SRC_PATH=~/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src/
fi

set -o ignoreeof
