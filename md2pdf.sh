#!/bin/bash

pandoc "$1" \
    `#-f gfm` \
    --toc \
    --toc-depth 3 \
    --include-in-header custom.tex \
    --include-in-header disable_float.tex \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    `#-V mainfont="Helvetica Neue"` \
    `#-V monofont="DejaVu Sans Mono"` \
    --pdf-engine=xelatex \
    -o "$2"

