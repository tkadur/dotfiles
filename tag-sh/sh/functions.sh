#!/usr/bin/env sh

# Don't complain about using `source` - we've taken care of that
# shellcheck disable=SC2039

exists_command () {
    [ -x "$(command -v "$1")" ] && return
}

exists_directory () {
    [ -d "$1" ] && return
}

exists_file () {
    [ -f "$1" ] && return
}

# Technically this checks if a variable is non-empty
# I couldn't figure out how to properly simulate indirect
# expansion in POSIX sh to actually check if a variable is set
# TODO: Fix this
exists_variable() {
    eval argval="\$$1"
    # Because shellcheck doesn't understand `eval`
    # shellcheck disable=SC2154
    [ -n "$argval" ] && return
}

# I like writing `source`
# But let's maintain strict POSIX compliance in .sh scripts
# TODO: Write a real `get_current_shell` or something and remove this hack
if ! exists_command 'source' && ! exists_variable "ZSH_NAME"; then
    alias source='.'
fi

# load modules robustly by skipping all remaining modules if any module fails to load
load_modules () {
    for module in "$@"; do
        if exists_file "$module"; then
            if source "$module"; then
                echo "Module $module failed to load!"
            fi
        else
            echo "Module $module does not exist!"
        fi
    done
}

load_modules_silent () {
    for module in "$@"; do
        if exists_file "$module"; then
            source "$module"
        fi
    done
}

add_to_path () {
    for dir in "$@"; do
        if exists_directory "$dir"; then
            export PATH="$PATH:$dir"
        else
            echo "Directory $dir not found to add to PATH!"
        fi
    done
}

add_to_path_silent () {
    for dir in "$@"; do
        if exists_directory "$dir"; then
            export PATH="$PATH:$dir"
        fi
    done
}

rlwrap_wrapper () {
    for name in "$@"; do
        if exists_command "rlwrap"; then
            # SC2139: We want this to expand at definition, not at use
            # SC2140: This is just a false positive
            # shellcheck disable=SC2139,SC2140
            alias "$name"="rlwrap $name"
        fi
    done
}
