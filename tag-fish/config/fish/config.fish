set FISHERMAN_LOCK_PATH $HOME/.config/fish/.fisherman.lock

if begin; not functions -q fisher; and not test -e $FISHERMAN_LOCK_PATH; end
    touch $FISHERMAN_LOCK_PATH
    echo "Auto-installing fisher..."
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    rm $FISHERMAN_LOCK_PATH

    # This overwrites any existing fishfile, so we need to re-link our version
    # This is admittedly a dirty hack.
    yes | rcup > /dev/null

    fish -c fisher
end

if begin; not type -q fisher; and not test -e $FISHERMAN_LOCK_PATH; end
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

  # Ideally, we want to read from the `fishfile`,
  # but fisherman erases the existing one whenever it gets installed.
  # So we have to manually install plugins.

end

# Guard against non-interactive logins
if not status --is-interactive
    exit
end

load_module ~/.sh/host.sh > /dev/null
load_module ~/.config/fish/host.fish > /dev/null
load_module ~/.config/fish/misc.fish
load_module ~/.config/fish/aliases.fish

# opam configuration
source /mnt/c/Users/Thejas/WSL/home/tkadur/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
