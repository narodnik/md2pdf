#!/bin/bash
FILENAME="$(basename "$1")"
OUTFILE="/tmp/${FILENAME%.md}.pdf"
md2pdf "$1" "$OUTFILE"
( zathura "$OUTFILE" ; rm -f "$OUTFILE" ) &> /dev/null
