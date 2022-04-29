#!/bin/bash
# This will load an md file that auto-re-renders when the md is changed
READER="${PDF_READER:=zathura}"
FILENAME="$(basename "$1")"
OUTFILE="/tmp/${FILENAME%.md}.pdf"
echo $1 | entr -rs "md2pdf \"$1\" \"$OUTFILE\"" &
entr_pid="$!"
( $READER "$OUTFILE" ; rm -f "$OUTFILE" ) > /dev/null
kill $entr_pid

