#
# ~/.profile
#

## PATH ##
export PATH="$PATH:$(du "$HOME/bin" "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

## DEFAULT PROGRAMS ##
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"
export SUDO_ASKPASS="$HOME/bin/dmenupass"

## HOME CLEAN UP? ##
