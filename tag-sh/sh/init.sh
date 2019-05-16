# Guard against non-interactive logins
[ -z "$PS1" ] && return

source ~/.sh/functions.sh
source ~/.sh/variables.sh