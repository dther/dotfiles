#
# ~/.profile
#

## SOURCE SYSTEM PROFILE ##
. /etc/profile

## PATH ##
export PATH="$PATH:$(du "$HOME/bin" "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

## DEFAULT PROGRAMS ##
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"
export SUDO_ASKPASS="$HOME/bin/dmenupass"
export NOIXDIR="$HOME/docs/notes"

## HOME CLEAN UP ##
# Most of this was taken from LukeSmithxyz/voidrice.git.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
#export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
#export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
#export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
#export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
#export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export WEECHAT_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/weechat"

export SOKSAVEDIR="${XDG_CONFIG_HOME:-$HOME/.config}/csokoban"
export BLKSAVEDIR="${XDG_CONFIG_HOME:-$HOME/.config}/cblocks"
export NETHACKOPTIONS="@${XDG_CONFIG_HOME:-$HOME/.config}/nethackrc"

## MISC ENVIRONMENT VARIABLES ##
# Java bein broke
export AWT_TOOLKIT=MToolkit

## eye candy
# XXX: Requires Flat Color GTK theme. It's on the AUR somewhere.
export GTK2_RC_FILES="/usr/share/themes/FlatColors/gtk-2.0/gtkrc"
export GTK_THEME="FlatColor:dark"

# makes Qt look like Gtk2 themes
# XXX: Requires 'qt5-styleplugins' from the AUR
export QT_QPA_PLATFORMTHEME="gtk2"
export QT_STYLE_OVERRIDE="gtk2"

# source bashrc?? I use yash now so i'll need to make changes. TODO
[ "$SHELL" = "/bin/bash" ] && . ~/.bashrc
