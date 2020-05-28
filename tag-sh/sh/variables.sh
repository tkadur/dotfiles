#!/usr/bin/env sh

#
# Editors
#
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

add_to_path_silent "$HOME/.cargo/bin" "$HOME/.local/bin" "/usr/local/smlnj/bin"

export LESS='-g -i -M -R -S -w -z-4'

export PYTHONSTARTUP=~/.pythonrc
