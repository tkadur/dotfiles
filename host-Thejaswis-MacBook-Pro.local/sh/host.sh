if exists_command 'brew'; then
  add_to_path_priority "$(brew --prefix llvm)/bin"
fi
