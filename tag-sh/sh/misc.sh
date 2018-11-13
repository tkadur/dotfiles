# Fix colors
export TERM=xterm-256color

# Fix vim ctrl+s to save
stty -ixon

# Add cargo to path
if [ -d "$HOME/.cargo/bin" ]; then
  # Control will enter here if $DIRECTORY exists.
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  # Control will enter here if $DIRECTORY exists.
  export PATH="$HOME/.local/bin:$PATH"
fi
