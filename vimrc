set nocompatible

" If there are any machine-specific tweaks for Vim, load them from the following file.
try
  runtime! config/plugin.vim
catch
  echo "No plugin support"
endtry

try
  runtime! config/keybindings.vim
catch
  echo "No keybindings support"
endtry

try
  runtime! config/settings.vim
catch
  echo "No plugin support"
endtry

try
  runtime! config/commands.vim
catch
  echo "No keybindings support"
endtry
