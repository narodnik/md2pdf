#!/bin/bash
READER="${PDF_READER:=zathura --mode fullscreen}"
FILENAME="$(basename "$1")"
OUTFILE="/tmp/${FILENAME%.md}.pdf"
md2pdf "$1" "$OUTFILE"
( $READER "$OUTFILE" ; rm -f "$OUTFILE" ) &> /dev/null
