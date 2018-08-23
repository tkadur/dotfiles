set FISHERMAN_LOCK_PATH $HOME/.config/fish/.fisherman.lock

if begin; not type -q fisher; and not test -e $FISHERMAN_LOCK_PATH; end
  echo "Auto-installing fisherman..."
  touch $FISHERMAN_LOCK_PATH
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  fisher MaxMilton/pure
  rm $FISHERMAN_LOCK_PATH
end

# Guard against non-interactive logins
if not status --is-interactive
    exit
end

load_module ~/.sh/host.sh > /dev/null
load_module ~/.config/fish/host.fish > /dev/null
load_module ~/.config/fish/misc.fish
load_module ~/.config/fish/aliases.fish
