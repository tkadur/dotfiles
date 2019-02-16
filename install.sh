#!/usr/bin/env sh

bold=$(tput bold)
red=$(tput setaf 1)
normal=$(tput sgr0)

INSTALL_LOCATION=~/.dotfiles.tmp

echo "${bold}Downloading config files...${normal}"
git clone --single-branch --branch vim-only https://github.com/tkadur/dotfiles.git $INSTALL_LOCATION || exit

if [ -e ~/.vimrc ] && [ ! $(cmp -s ~/.vimrc $INSTALL_LOCATION/vimrc) ]
then
    while true; do
	    read -p "${red}You seem to already have your own ~/.vimrc.${normal} Do you wish to move it to ~/.vimrc.bak and continue installation? (y/n) " yn
	    case $yn in
		[Yy]* ) break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	    esac
    done

    mv ~/.vimrc ~/.vimrc.bak
fi
cp $INSTALL_LOCATION/vimrc ~/.vimrc

result=$(diff -r ~/.vim/config $INSTALL_LOCATION/vim/config >/dev/null 2>/dev/null)
if [ -e ~/.vimrc ] && [ $? -ne 0 ]
then
    echo "${red}You seem to already have your own ~/.vim/config. Exiting installation.${normal}"
    exit
fi
cp -R $INSTALL_LOCATION/vim/config ~/.vim/config

vim +PlugInstall +qall

mkdir -p ~/.vim/undodir

printf "\n\n${bold}Installation complete!${normal}"
echo '- Here are some convenient things you can do: '
echo '- Comment/uncomment a line with `gcc` (`gc` when selecting text in visual mode)'
echo '- Search with `/` or `Ctrl+f` and clear search result highlighting with `Esc Esc`'
echo '- Type `U` to undo and `R` to redo'
echo '- Type ` u` to see your undo history (yes, with a space)'
echo '- Type ` n` to open a file explorer tree (yes, with a space again)'

rm -rf $INSTALL_LOCATION
