set FISHERMAN_LOCK_PATH $HOME/.config/fish/.fisherman.lock

if begin; not type -q fisher; and not test -e $FISHERMAN_LOCK_PATH; end
  echo "Auto-installing fisherman..."
  touch $FISHERMAN_LOCK_PATH
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

  # Ideally, we want to read from the `fishfile`,
  # but fisherman erases the existing one whenever it gets installed.
  # So we have to manually install plugins.

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
