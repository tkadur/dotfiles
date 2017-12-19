source ~/.sh/alias_core.sh

# color support for ls and grep
if [[ "$OSTYPE" == "darwin"* ]] || [[ "$OSTYPE" == "freebsd"* ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

# Enable "up" for previous commands
if [ -x "$(command -v rlwrap)" ]; then
  if [ -x "$(command -v sml)" ]; then
    alias sml="rlwrap sml"
  elif [ -x "$(command -v poly)" ]; then
    alias poly='rlwrap poly'
    alias sml='poly'
  fi
fi

# Print name of shell currently being used
alias shell='ps -p $$ -o comm='

# Shortand ls options
if [ -x "$(command -v exa)" ]; then
  alias ls='exa'
fi

# General use stuff
alias mine="sudo chown $(whoami)"
if [ -x "$(command -v nvim)" ]; then
  alias vim="nvim"
fi

if [ -x "$(command -v mvim)" ]; then
  alias mvim="mvim -v"
fi

# Open manpages in vim
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}
