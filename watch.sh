#!/usr/bin/env bash

# Simple script to watch LaTeX file and view in Zathura with real-time updates

cd "$(dirname "$0")"

# Ensure PDF exists before opening
if [ ! -f "main.pdf" ]; then
    echo "Compiling initial PDF..."
    pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1
fi

# Open Zathura with auto-reload enabled (Zathura auto-reloads by default)
zathura --fork main.pdf &

# Run latexmk in continuous preview mode
latexmk -pvc -pdf -interaction=nonstopmode -view=none main.tex


