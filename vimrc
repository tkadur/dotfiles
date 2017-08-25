
try
  runtime! config/plugins.vim
catch
  echo "Plugins broken"
endtry

try
  runtime! config/keybindings.vim
catch
  echo "Keybindings broken"
endtry

try
  runtime! config/commands.vim
catch
  echo "Custom commands broken"
endtry

try
  runtime! config/settings.vim
catch
  echo "Misc. settings broken"
endtry
