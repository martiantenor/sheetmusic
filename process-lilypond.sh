#!/usr/bin/env bash

## Lilypond source file directory
sourcedir="./source-files"

## Style sheet
## TODO: implement this in lilypond command below
#stylesheet="./stylefiles/style.ily"

## Empty folders if they do exist, create folders if they don't
if [ -d "midi" ]; then
    find midi/ -type f -name "*.midi" -delete
else
    mkdir "midi"
fi
if [ -d "pdf" ]; then
    find pdf/ -type f -name "*.pdf" -delete
else
    mkdir "pdf"
fi

## Compile all files 
lilypond -e '(define-public style-sheet "./stylefiles/style.ily")' $sourcedir/*.ly &&

## Cleanup
mv *.midi ./midi &&
mv *.pdf ./pdf
