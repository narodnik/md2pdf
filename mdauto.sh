#!/bin/bash
# This will load an md file that auto-re-renders when the md is changed
FILENAME="$(basename "$1")"
OUTFILE="/tmp/${FILENAME%.md}.pdf"
echo $1 | entr -rs "md2pdf \"$1\" \"$OUTFILE\"" &
zathura --mode fullscreen $OUTFILE &> /dev/null

