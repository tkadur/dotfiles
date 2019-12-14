#!/usr/bin/env sh

#
# Editors
#
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

add_to_path_silent "$HOME/.cargo/bin" "$HOME/.local/bin" "/usr/local/smlnj/bin"

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
# export LESS='-F -g -i -M -R -S -w -X -z-4'
export LESS='-g -i -M -R -S -w -z-4'

export PYTHONSTARTUP=~/.pythonrc
