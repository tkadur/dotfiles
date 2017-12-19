source ~/.sh/alias_core.sh

# color support for ls and grep
switch (uname)
  case Linux
    alias ls='ls --color=auto'
  case Darwin FreeBSD NetBSD DragonFly
    alias ls='ls -G'
end

# Enable "up" for previous commands
if type -q "rlwrap"
  if type -q "sml"
    alias sml='rlwrap sml'
  else if type -q "poly"
    alias poly='rlwrap poly'
    alias sml='poly'
  end
end

# Print name of shell currently being used
alias shell='ps -p %self -o comm='
#
# Shortand ls options
if type -q "exa"
  alias ls='exa'
end

# General use stuff
alias mine="sudo chown (whoami)"
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
