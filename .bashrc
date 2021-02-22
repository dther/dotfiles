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
export LITEWIKI="$HOME/docs/wiki"
export INPUTRC='~/.inputrc'

# Home clean up.
# TODO: MOVE THIS TO ANOTHER FILE. IN $XDG_CONFIG_HOME, IDEALLY.
alias cataclysm="cataclysm --configdir $XDG_CONFIG_HOME/.config/cataclysm-dda"
alias cmines="cmines -s $XDG_CONFIG_HOME/cminesrc"
alias crawl="crawl -dir $XDG_CONFIG_HOME/crawl"
alias abook="abook -C $XDG_CONFIG_HOME/abook/abookrc --datafile $XDG_DATA_HOME/abook/addressbook"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Prompt
PS1='\A \[\e[0;31m\][\[\e[0;33m\]\u\[\e[m\]@\[\e[0;34m\]\h\[\e[m\] \[\e[0;96m\]\w\[\e[0;31m\]]\[\e[m\]\$ '

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
alias td="todo.sh -tc"
alias todo="td"

alias backlog="td -d ~/.todo/backlogconf"
alias bibleplan="td -aTd ~/.todo/bible"

# imagine using nano
alias nano="echo How about naNO && sleep 0.5 && vim"

# avoid rm, it's easy to make horrible mistakes
alias rm="echo You probably want \'trash\'. && rm -vi"

# Run stuff
pfetch
printf "\n"
td ls
