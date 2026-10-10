#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Happy Birthday"
  composer = ""
  arranger = ""
  tagline = ""
}

keytimetempo = {
  \key d \major %to fall on the bass's open A string
  \time 3/4
  %\tempo "brisk" 4=105
  %\numericTimeSignature %use "4/4" instead of "C"
}

melody = \relative c {
  \keytimetempo

  % in D
  \partial 4 { a8. a16 }
  b4 a d | cs2 a8. a16 | 
  b4 a e' | d2 a8. a16 |
  a'4 fs d | cs(b)\fermata g'8. g16 |
  fs4 d e | d2 \fine


  %% in G
  %\partial 4 { d8. d16 }
  %e4 d g | fs2 d8. d16 | 
  %e4 d a' | g2 d8. d16 |
  %d'4 b g | fs(e)\fermata c'8. c16 |
  %b4 g a | g2 \fine
}

thesechords = \chordmode {
}

thelyrics = \lyricmode {
}

%tuneflattened = \absolute {
%}

\score {
  \header {
    \thisheader
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \thesechords
    }
    \new Staff <<
      \clef "bass"
      \accidentalStyle "modern"
      \new Voice = "melody" {
        \melody
      }
      \new Lyrics \lyricsto "melody" {
        \thelyrics
      }
    >>
  >>
  \layout { }
}

\score {
  %{
  \new Staff {
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
    \accidentalStyle "modern"
    \keytimetempo
    \unfoldRepeats \articulate {
      \thismelody
    }
  }
  %}
  \new Staff <<
    \set Staff.midiInstrument = #"fretless bass"
    \new Voice {
      \unfoldRepeats \articulate {
        \melody
      }
    }
  >>
  \midi {
    \tempo 4 = 100
  }
}
