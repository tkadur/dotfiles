#!/usr/bin/env sh

# Fix vim ctrl+s to save
stty -ixon

if exists_file "$HOME/.opam/opam-init/init.sh"; then
  # We alias `source` to `.` in `tag-sh/sh/init.sh`, but shellcheck doesn't know that
  # shellcheck disable=SC2039
  source "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true
fi
