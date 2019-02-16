try
  runtime! config/plugins.vim
catch
  echo "Something in ~/.vim/config/plugins.vim is broken"
endtry

try
  runtime! config/keybindings.vim
catch
  echo "Something in ~/.vim/config/keybindings.vim is broken"
endtry

try
  runtime! config/commands.vim
catch
  echo "Something in ~/.vim/config/commands.vim is broken"
endtry

try
  runtime! config/settings.vim
catch
  echo "Something in ~/.vim/config/config.vim is broken"
endtry

