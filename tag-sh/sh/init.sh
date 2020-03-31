#!/usr/bin/env sh

# Guard against non-interactive logins
[ -z "$PS1" ] && return

source ~/.sh/functions.sh
load_modules_silent ~/.sh/host/functions.sh

load_modules ~/.sh/variables.sh
load_modules_silent ~/.sh/host/variables.sh
