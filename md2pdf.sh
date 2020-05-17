#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

if [[ $# -gt 1 ]]; then
    OUTPUT="$2"
else
    OUTPUT="${1%.md}.pdf"
fi

pandoc "$1" \
    `#-f gfm` \
    --toc \
    --toc-depth 3 \
    --include-in-header $DIR/custom.tex \
    --include-in-header $DIR/disable_float.tex \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    `#-V mainfont="Helvetica Neue"` \
    `#-V monofont="DejaVu Sans Mono"` \
    --pdf-engine=xelatex \
    -o "$OUTPUT"

