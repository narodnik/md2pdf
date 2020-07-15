#!/bin/bash
FILENAME="$(basename "$1")"
OUTFILE="/tmp/${FILENAME%.md}.pdf"
md2pdf "$1" "$OUTFILE"
qpdfview $OUTFILE &> /dev/null

