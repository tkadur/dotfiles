source ~/.sh/alias_core.sh

# color support for ls and grep
switch (uname)
  case Linux
    alias ls='ls --color=auto'
  case Darwin FreeBSD NetBSD DragonFly
    alias ls='ls -G'
end

wsl_aliases "sml" "stack" "cabal" "ghc" "ghci" "idris"

# Enable "up" for previous commands
if type -q "rlwrap"
end

# Print name of shell currently being used
alias shell='ps -p %self -o comm='

# Shortand ls options
if type -q "exa"
  alias ls='exa'
  alias tree='ls -T'
end

# General use stuff
if type -q "nvim"
  alias vim="nvim"
end

if type -q "mvim"
  alias mvim="mvim -v"
end

# Open manpages in vim
function vman
  vim -c "SuperMan $argv"

  if test "$status" != "0"
    echo "No manual entry for $argv"
  end
end

# Open things in WSL
if type -q "cmd.exe"
  function open
    echo $argv | sed 's/\/mnt\/\(.\)/\1:/1' | xargs cmd.exe /C start
  end
end
