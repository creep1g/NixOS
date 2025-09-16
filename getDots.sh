#!/usr/bin/env bash 

set -e

DOTFILES="$HOME/Dotfiles"

if [ ! -d "$DOTFILES" ]; then
	git clone https://github.com/creep1g/NixOS-Dotfiles.git "$DOTFILES"
else
	cd "$DOTFILES"
	git pull
fi

