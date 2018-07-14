set OMF_LOCK_PATH $HOME/.config/fish/.omf.lock

if begin; not type -q omf; and not test -e $OMF_LOCK_PATH; end
  echo "Auto-installing oh-my-fish..."
  touch $OMF_LOCK_PATH
  curl -L https://get.oh-my.fish | fish
  rm $OMF_LOCK_PATH
end

# Guard against non-interactive logins
if not status --is-interactive
    exit
end

load_module ~/.sh/host.sh > /dev/null
load_module ~/.config/fish/host.fish > /dev/null
load_module ~/.config/fish/misc.fish
load_module ~/.config/fish/aliases.fish
