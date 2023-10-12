#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

if [[ $# -gt 1 ]]; then
    OUTPUT="$2"
else
    OUTPUT="${1%.md}.pdf"
fi

INPUT=$(realpath $1)
OUTPUT=$(realpath $OUTPUT)

cd /tmp/
pandoc "$INPUT" \
    -F pandoc-crossref \
    --pdf-engine=xelatex \
    --toc \
    --toc-depth 3 \
    --include-in-header $DIR/custom.tex \
    --include-in-header $DIR/disable_float.tex \
    --number-sections \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    --resource-path=$(dirname $INPUT) \
    -o "$OUTPUT"

# -V geometry:papersize="{6in,7.5in}" \
# -V geometry:margin=0.1cm \
# -V fontsize=17pt \

