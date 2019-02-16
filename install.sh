#!/usr/bin/env sh

INSTALL_LOCATION=~/.dotfiles.tmp

git clone --single-branch --branch vim-only https://github.com/tkadur/dotfiles.git $INSTALL_LOCATION

result=$(diff ~/.vimrc $INSTALL_LOCATION/vimrc 1>&2 2>/dev/null)
if [ -e ~/.vimrc ] && [ $? -ne 0 ] 
then
    while true; do
	    read -p "You seem to already have your own ~/.vimrc. Do you wish to move it to ~/.vimrc.bak and continue installation?" yn
	    case $yn in
		[Yy]* ) break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	    esac
    done

    mv ~/.vimrc ~/.vimrc.bak
fi
cp $INSTALL_LOCATION/vimrc ~/.vimrc

result=$(diff -r ~/.vim/config $INSTALL_LOCATION/vim/config 1>&2 2>/dev/null)
if [ -e ~/.vimrc ] && [ $? -ne 0 ] 
then
    echo "You seem to already have your own ~/.vim/config. Exiting installation."
    exit
fi
cp -R $INSTALL_LOCATION/vim/config ~/.vim/config

vim +PlugInstall +qall

rm -rf $INSTALL_LOCATION
