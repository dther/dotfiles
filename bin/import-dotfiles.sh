#!/bin/sh

git clone --bare git@github.com:dther/dotfiles.git "$HOME/.myconf"
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no

if config checkout; then
	printf "%s\n" "Dotfiles installed successfully."
	exit 0
fi;

printf "Failed to install dotfiles! Please check/backup the following files:\n"
config checkout
printf "and try again.\n"
