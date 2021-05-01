#!/bin/sh

when "$@" | sed -E "
        /:red/s/^/$(tput setaf 1)/;
        /:green/s/^/$(tput setaf 2)/;
        /:yellow/s/^/$(tput setaf 3)/;
        /:blue/s/^/$(tput setaf 4)/;
        /:magenta/s/^/$(tput setaf 5)/;
        /:cyan/s/^/$(tput setaf 6)/;
        /:grey/s/^/$(tput setaf 7)/;
        /:black/s/^/$(tput setaf 8)/;
        /:brightred/s/^/$(tput setaf 9)/;
        /:brightgreen/s/^/$(tput setaf 10)/;
        /:brightyellow/s/^/$(tput setaf 11)/;
        /:brightblue/s/^/$(tput setaf 12)/;
        /:brightmagenta/s/^/$(tput setaf 13)/;
        /:brightcyan/s/^/$(tput setaf 14)/;
        /:brightgrey/s/^/$(tput setaf 15)/;
        /:brightblack/s/^/$(tput setaf 16)/;
        /DUE/s/^/$(tput setaf 9)$(tput bold)/;
        s/today/$(tput smso)today$(tput rmso)/;
        s/\*\*(.*)\*\*/$(tput smso)\1$(tput ritm)/;
        s/\*(.*)\*/$(tput sitm)\1$(tput ritm)/;
        s/ :.*$//g;
        s/$/$(tput sgr0)/;"
