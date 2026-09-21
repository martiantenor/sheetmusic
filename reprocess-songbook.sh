#!/usr/bin/env bash

## Songbook folder & filename
songbookname="Songbook"

## Style sheet
## TODO: implement this in lilypond command below
#stylesheet="./stylefiles/songbookstyle.ily"

## Delete existing songbook PDF if it exists
find songbook/ -type f -name "$songbookname".pdf -delete

## Compile the songbook
lilypond -e '(define-public style-sheet "./stylefiles/songbookstyle.ily")' ./songbook/"$songbookname".ly &&

## Cleanup
rm "$songbookname"*.midi
mv "$songbookname".pdf ./songbook

# Keeps the .ly file around so you can manually go back in
# and add \pageBreak commands and re-process if necessary using the
# "reprocess_songbook.sh" script
