#!/bin/bash

#DIR="$(dirname "$(readlink "$0")")"    ## macos
DIR="$(dirname "$(readlink -f "$0")")"

if [[ $# -gt 1 ]]; then
    OUTPUT="$2"
else
    OUTPUT="${1%.md}.pdf"
fi

# realpath function for macos
#realpath() {
#    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
#}

INPUT=$(realpath $1)
OUTPUT=$(realpath $OUTPUT)

cd /tmp/
pandoc "$INPUT" \
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

