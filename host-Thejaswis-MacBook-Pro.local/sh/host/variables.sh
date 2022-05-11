# if exists_command 'brew'; then
#   PREFIX=$(brew --prefix llvm)
#   add_to_path_priority "$PREFIX/bin"
#   LDFLAGS="$LDFLAGS,-L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"
# fi

add_to_path_silent "/usr/local/texlive/2019/bin/x86_64-darwin"

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM

add_to_path_priority "$(brew --prefix)/opt/llvm/bin"
export LDFLAGS="-L$(brew --prefix)/opt/llvm/lib -Wl,-rpath,$(brew --prefix)/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
