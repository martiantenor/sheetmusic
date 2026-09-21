#!/usr/bin/env bash

## Style sheet
stylesheet="./stylefiles/style.ily"

## Empty folders if they do exist, create folders if they don't
if [ -d "midi" ]; then
    rm -rf "midi/*"
else
    mkdir "midi"
fi
if [ -d "pdf" ]; then
    rm -rf "pdf/*"
else
    mkdir "pdf"
fi

## Compile all files
lilypond -e '(define-public style-sheet "./stylefiles/style.ily")' ./source-files/*.ly

## Cleanup
mv *.midi ./midi &&
mv *.pdf ./pdf
