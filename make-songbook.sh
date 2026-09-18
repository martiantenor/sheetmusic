#!/usr/bin/env bash

## Style sheet
stylesheet="./stylefiles/songbookstyle.ily"

## Songbook filename (used internally in script)
songbookname="Songbook"

## Empty folders if they do exist, create folders if they don't
if [ -f "$songbookname.ly" ]; then
    rm -rf "$songbookname.ly"
else
    touch "$songbookname.ly"
    echo '\version "2.24.0"' >> "$songbookname.ly"
fi
echo '\version "2.24.0"' >> "$songbookname.ly"

## Build the songbook file
for file in ./source-files/*.ly; do
    echo "\\include \"$file\"" >> "$songbookname.ly"
done

## Compile the songbook
#lilypond -e '(define-public style-sheet "./stylefiles/style.ily")' "$songbookname".ly
lilypond -e '(define-public style-sheet "./stylefiles/songbookstyle.ily")' "$songbookname".ly

## Cleanup
rm "$songbookname.ly"
rm "$songbookname"*.midi
mv $songbookname.pdf ./pdf
