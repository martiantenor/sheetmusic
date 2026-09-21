#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "The Swallowtail"
  arranger = "arr. fidicien, https://thesession.org/tunes/106"
  composer = "Irish trad. / New England"
}

keytimetempo = {
  \key e \dorian
  \time 6/8
  \tempo "double jig" 4.=75-130
}

thistune = \relative c' {
  \keytimetempo
  
  % A section
  \repeat volta 2 {
    g'8 e e b' e, e | g e e b' a g | fs d d a' d, d | d' cs d a g fs |
    g e e b' e, e | g e g b4 cs8 | d cs d a g fs | g e e e4. |
  }

 
  % B section
  \repeat volta 2 {
    b'8 cs d e4 fs8 | e4 fs8 e d b | b cs d e4 fs8 | e d b d4. |
    b8 cs d e4 fs8 | e4 fs8 e d b | d cs d a g fs | g e e e4. |
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
