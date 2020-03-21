#
# ~/.bashrc
#
# Set environmental variables
export TERMCMD='st -e '
export TERMINAL='st'
export VISUAL='vim'
export EDITOR=$VISUAL
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CONFIG_HOME="$HOME/.config/"
export QT_QPA_PLATFORMTHEME="gtk2"
export GTK_THEME="FlatColor:dark"
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Check if running in terminal emulator - if it is, then use different .inputrc
if [ !$DISPLAY ]; then
    export INPUTRC='~/.inputrc_tty'
else
    export INPUTRC='~/.inputrc'
fi

alias ls='ls --color=auto'
alias pacman='pacman --color auto'

PS1='\A \[\e[0;31m\][\[\e[0;93m\]\u\[\e[m\]@\[\e[0;94m\]\h\[\e[m\] \[\e[0;96m\]\w\[\e[0;31m\]]\[\e[m\]\$ '

# Import wal colours
. "${HOME}/.cache/wal/colors.sh"

# me and my roguelikes
alias angband='angband -mgcu'

# make dmenu always the right colour
alias dmenu='dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'

alias logisim-evolution='logisim-evolution -analyze'

# suckless thefuck replacement
alias pls='sudo'
alias please='pls'
alias fudge='sudo sh -c "$(fc -ln -1)"'
alias heck='fudge'
alias darn='fudge'
alias crap='fudge'
alias fuck="echo Y\'know, don\'t say swears."

# for interacting with the git bare repository
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no

# because screw limited passes, man.
# If it takes you more passes than 999 you suck at solitaire
alias ttysolitaire='ttysolitaire -p 999'

#override standard ANSI colours. 
# Note to self: should probably have a way to 
# differentiate between light and dark.

# if st, don't set background, so as to not conflict with alpha.
# if [ $TERM = 'st-256colors' ]; then
# 	export BASE16_SHELL_SET_BACKGROUND=false
# fi
# 
# export BASE16_SHELL_SET_BACKGROUND=false
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"
# 

# Run stuff
pfetch

