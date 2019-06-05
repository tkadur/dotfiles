# Fix vim ctrl+s to save
stty -ixon

if exists_file "$HOME/.opam/opam-init/init.sh"; then
  . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
fi
