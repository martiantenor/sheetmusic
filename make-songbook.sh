#!/usr/bin/env bash

## Songbook folder & filename
songbookname="Songbook"

## Style sheet
## TODO: implement this in lilypond command below
#stylesheet="./stylefiles/songbookstyle.ily"

## Empty songbook folder if it exists, create if it doesn't
if [ -d  "songbook" ]; then
    find songbook/ -type f -delete
else
    mkdir ./songbook
fi

## Build the songbook file from scratch
echo "\\version \"2.24.0\"" > "$songbookname.ly"
for file in ./source-files/*.ly; do
    echo "\\include \"$file\"" >> "$songbookname.ly"
done

## Compile the songbook
lilypond -e '(define-public style-sheet "./stylefiles/songbookstyle.ily")' "$songbookname".ly &&

## Cleanup
rm "$songbookname"*.midi
mv $songbookname.pdf $songbookname.ly ./songbook

# Keeps the .ly file around so you can manually go back in
# and add \pageBreak commands and re-process if necessary using the
# "reprocess_songbook.sh" script
