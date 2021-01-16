#
# ~/.bash_profile
#

# source profile if it exists
[[ -f ~/.profile ]] && . ~/.profile

# do something about java being awful
export AWT_TOOLKIT=MToolkit

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start X session
# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
# 	exec startx
# fi
