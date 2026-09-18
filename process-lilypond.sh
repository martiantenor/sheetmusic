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
    rm -rf "midi/*"
else
    mkdir "pdf"
fi

## Compile loop
for file in ./source-files/*.ly; do
    #lilypond -e '(define-public style-sheet "./stylefiles/style.ily")' "$file"
    lilypond -e '(define-public style-sheet "./stylefiles/style.ily")' "$file"
done &&

## Cleanup
mv *.midi ./midi &&
mv *.pdf ./pdf
