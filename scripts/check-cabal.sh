#!/bin/sh

# Checking if cabal is available
if [ -z $(which "cabal") ]; then
	echo "Cabal hasn't been found, make sure it is in your PATH or install it"
	echo "before continuing:"
	echo " - debian/ubuntu:"
	echo "   sudo apt-get install cabal-install"
	echo " - Arch Linux:"
	echo "   sudo pacman -S cabal-install"
	echo "More information on: https://www.haskell.org/downloads/linux"
	echo 
	exit 1
fi

