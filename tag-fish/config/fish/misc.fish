# Fix colors
set TERM xterm-256color

# Add cargo to path
if test -d "$HOME/.cargo/bin"
  set PATH $HOME/.cargo/bin $PATH
end

if test -d "$HOME/.local/bin"
  set PATH $HOME/.local/bin $PATH
end
