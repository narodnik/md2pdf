#!/bin/bash
# This will load an md file that auto-re-renders when the md is changed
READER="${PDF_READER:=zathura --mode fullscreen}"
FILENAME="$(basename "$1")"
OUTFILE="/tmp/${FILENAME%.md}.pdf"
md2pdf "$1" "$OUTFILE"
echo $1 | entr -rs "md2pdf \"$1\" \"$OUTFILE\"" &
entr_pid="$!"
( $READER "$OUTFILE" ; rm -f "$OUTFILE" ) > /dev/null
kill $entr_pid

