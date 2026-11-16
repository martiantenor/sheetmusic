\language "english"         %English note names like "eb" and "ds"
\include "articulate.ly"    %more musical MIDI output
\version "2.24.0"

\paper {
  %#(set-paper-size "letter")
  #(set-paper-size "half letter")
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  two-sided = ##t
  indent = 0
  print-all-headers = ##t
  ragged-bottom = ##t
  ragged-right = ##f
}

thisheader = \header {
  title = "Bagpipe Fingering Chart"
  composer = "https://www.bagpipejourney.com/articles/finger_positions.shtml"
}

keytimetempo = {
  \key c \major
  \time 9/4
  \numericTimeSignature %use "4/4" instead of "C"
}

% The traditional bagpipe scale doesn't mark the C or F as sharp,
% so that's noted here with parentheses

melody = \relative c'' {
  g4 a b cs? d e fs? g a \break
  c, f g a r4 r r r r 
}

\score {
  \header {
    \thisheader
  }
  <<
    \new Staff \with { \omit TimeSignature} <<
      
      \keytimetempo
      \accidentalStyle "modern"
      \new Voice = "melody" {
        \melody
      }
    >>
  >>
  \layout { 
    \context {
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
    }
  }
}
