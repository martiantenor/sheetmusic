#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "The Lilting Banshee"
  arranger = "arr. Jeremy, https://thesession.org/tunes/60"
  composer = "Irish trad."
}

keytimetempo = {
  \key a \dorian
  \time 6/8
  \tempo "double jig" 4.=75-130
}

thistune = \relative c' {
  \keytimetempo
  
  % A section
  \repeat volta 2 {
    e8 a a e a a | b a b g4 a8 | b e e e d b | d e fs g fs g |
    e a, a e' a, a | b a b g4 a8 | b e e e d b | d b a a4. |
  }

 
  % B section
  \repeat volta 2 {
    e'8 a a a g e | d b a g4 a8 | b e e e d b | d e fs g fs g |
    e a a a g e | d b a g4 a8 | b e e e d b | d b a a4. |
  }
  
}

thesechords = \chordmode {
}

\score {
  \header {
    \thisheader
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \thesechords
    }
    %{
    \new FretBoards {
      \set chordChanges = ##t
      \cheatsheet
    }
    %}
    \new Staff <<
      \clef "treble"
      \accidentalStyle "modern"
      \new Voice {
        \thistune
      }
    >>
  >>
  \layout { }
}

\score {
  <<
    %{
    \new ChordNames {
      \set chordChanges = ##t
      \set midiInstrument = #"acoustic guitar (steel)"
        \unfoldRepeats {
          \cheatsheet
        }
    }
    %}
    \new Staff <<
      \set Staff.midiInstrument = #"violin"
      \new Voice {
        \unfoldRepeats \articulate {
        \thistune
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 120
  }
}
