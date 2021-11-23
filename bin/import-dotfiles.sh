#!/bin/sh

# Initialise home directory the way I like it.
# Installs configuration and creates the necessary XDG directories
# (e.g. Pictures, Documents, but named the way I like them)

git clone --bare git@github.com:dther/dotfiles.git "$HOME/.myconf"
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no

if config checkout; then
	printf "%s\n%s\n" "Dotfiles installed successfully." \
		"Making XDG directories..."
	while read -r dir; do
		dir=${dir%%#*}
		[ -z "$dir" ] && continue
		dir=${dir#*\"}
		dir=${dir%%\"*}
		# simulate xdg-user-dir's "shell expansion" (it doesn't really)
		dir=$(printf "%s" "$dir" | sed "s|\$HOME|$HOME|g")
		printf "Making %s...\n" "$dir"
		mkdir "$dir"
	done < "$HOME/.config/user-dirs.dirs"
	printf "%s\n" \
"That should have been mostly painless.
Run 'xdg-user-dirs-update' to finish up.
(This allows userspace programs to know where your folders are...)"
	exit 0
fi;

printf "Failed to install dotfiles! Please check/backup your files and try again."
exit 1
