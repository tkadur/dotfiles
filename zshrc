# load a module robustly by skipping all remaining modules if any module fails
# to load
load_module() {
    if [ -n "$ABORTED" ]; then
        return
    fi

    module="$1"
    if [ -f "$module" ]; then
        source $module

        if [ "$?" != "0" ]; then
            echo "Module $module failed to load. Exiting."
            export ABORTED=1
            return
        fi
    fi
}

# Guard against non-interactive logins
[ -z "$PS1" ] && return

# Custom aliases
load_module ~/.scripts/aliases.sh

# Oh-my-zsh configuration
load_module ~/.scripts/omz.sh

# Miscellaneous stuff
load_module ~/.scripts/misc.sh
