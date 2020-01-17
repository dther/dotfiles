#
# ~/.bash_profile
#

# set path
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# do something about java being awful
export AWT_TOOLKIT=MToolkit

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start X session
# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
# 	exec startx
# fi
