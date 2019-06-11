#!/usr/bin/env sh

# Guard against non-interactive logins
[ -z "$PS1" ] && return

source ~/.sh/functions.sh
load_modules ~/.sh/variables.sh
