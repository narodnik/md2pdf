#!/bin/bash
TEMPFILE=$(mktemp /tmp/mdview-XXXXX.pdf)
md2pdf "$1" $TEMPFILE
qpdfview $TEMPFILE &> /dev/null

