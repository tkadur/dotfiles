# Guard against non-interactive logins
[ -z "$PS1" ] && return

source ~/.sh/functions.sh
