#if begin; not type -q omf; and test -z "$INSTALLING_OMF"; end
#  echo "Installing oh-my-fish..."
#  set -lx INSTALLING_OMF 1
#  curl -L https://get.oh-my.fish | fish
#end

# Guard against non-interactive logins
if not status --is-interactive
    exit
end

load_module ~/.sh/host.sh
load_module ~/.sh/misc.sh
load_module ~/.sh/alias_core.sh
load_module ~/.config/fish/aliases.fish
