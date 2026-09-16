#!/usr/bin/env bash

## Style sheet
stylesheet = "./stylefiles/style.ily"

## Compile loop
for file in ./source-files/*; do
    lilypond -e '(define-public style-sheet "./stylefiles/style.ily")' "$file"
done &&

## Cleanup
mv *.midi ./midi &&
mv *.pdf ./pdf
