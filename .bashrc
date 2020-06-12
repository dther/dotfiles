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

# Import wal colours
. "${HOME}/.cache/wal/colors.sh"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Check if running in terminal emulator - if it is, then use different .inputrc
if [ !$DISPLAY ]; then
    export INPUTRC='~/.inputrc_tty'
else
    # A more tmux friendly inputrc
    export INPUTRC='~/.inputrc'
fi

# Prompt
PS1='\A \[\e[0;31m\][\[\e[0;93m\]\u\[\e[m\]@\[\e[0;94m\]\h\[\e[m\] \[\e[0;96m\]\w\[\e[0;31m\]]\[\e[m\]\$ '

### Useful Aliases ###

# system commands
alias ls='ls --color=auto'
alias pacman='pacman --color auto'
alias info='info --vi-keys'

# for interacting with the git bare repository
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no


# suckless thefuck replacement
alias pls='sudo'
alias please='pls'
alias fudge='sudo sh -c "$(fc -ln -1)"'
alias heck='fudge'
alias darn='fudge'
alias crap='fudge'
alias fuck="echo Y\'know, don\'t say swears."


### Program Specific Aliases ###

# because screw limited passes, man.
# If it takes you more passes than 999 you suck at solitaire
alias ttysolitaire='ttysolitaire --no-background-color -p 999'

# terminal aesthetic B-)
alias angband='angband -mgcu'

# todo.sh alias
alias todo="todo.sh -tc"

# Run stuff
pfetch
when --future=1 --past=0
printf "\n"
todo list
