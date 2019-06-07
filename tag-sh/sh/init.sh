#!/usr/bin/env sh

# Guard against non-interactive logins
[ -z "$PS1" ] && return

# I like writing `source`
# But let's maintain strict POSIX compliance in .sh scripts
if ! exists_command 'source'; then
    alias source='.'
fi

source ~/.sh/functions.sh
load_modules ~/.sh/variables.sh
