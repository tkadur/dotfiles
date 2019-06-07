#!/usr/bin/env sh

exists_command () {
    [ -x "$(command -v "$1")" ] && return
}

exists_directory () {
    [ -d "$1" ] && return
}

exists_file () {
    [ -f "$1" ] && return
}

# load modules robustly by skipping all remaining modules if any module fails to load
load_modules () {
    for module in "$@"; do
        if exists_file "$module"; then
            . "$module"

            if [ "$?" != "0" ]; then
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
            . "$module"
        fi
    done
}

add_to_path () {
    for dir in "$@"; do
        if exists_directory "$dir"; then
            export PATH="$PATH:$dir"
        else
            echo "Directory $dir not found to add to PATH! Aborting..."
            exit 1
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
            # We want this to expand at definition, not at use
            # shellcheck disable=SC2139

            # This is just a false positive
            # shellcheck disable=SC2140
            alias "$name"="rlwrap $name"
        fi
    done
}
