#!/bin/sh

# Memory module

free | awk '($1 == "Mem:"){printf "%.1f%", $7/$2*100}'
