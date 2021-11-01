#!/bin/sh

# Lightweight file previewer for lf and maybe ranger, I dunno.

FILE=$1
COLUMNS=$2
LINES=$3
# unused, may be used in the future for sixels
#DX=$4
#DY=$5

test -L "$FILE" && FILE=$(readlink -f "$FILE")
MIME=$(file --mime-type -b "$FILE")
case $MIME in
	#text/*) fold -sw "$COLUMNS" "$FILE";; # Alternate, folds lines
	text/*) cat "$FILE";;
	image/*) chafa "$FILE" -s "$COLUMNS"x"$LINES";;
	*) file "$FILE" | fold -sw "$COLUMNS" && exit 1;;
esac
