#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Morrison's"
  subtitle = ""
  composer = "Irish trad."
  arranger = ""
  meter = ""
  tagline = ""
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
    e4. b'4. | e,8 b' e, a fs d | e8 d e b'4. | d8 cs b a fs d |
    e4. b'4. | e,8 b' e, a fs d | g4. fs8 g a | d a g fs e d |
  }

  %B section
  b'8 e e fs e e | a e e fs e e | b e e fs e e | a4 g8 fs e d |
  b8 e e fs e e | a e e fs e e | g fs e d4 a8 | b a g fs g a |
  b8 e e fs e e | a e e fs e e | b e e fs e e | fs a fs d e fs |
  g4. g8 fs e | d e fs g4 d8 | e d cs d4 a8 | b a g fs e d |

  \fine

}

thesechords = \chordmode {
  % A section
  \repeat volta 2 {
    e2.:m | e4.:m d4. | e2.:m | g2. | e2.:m | e4.:m d4. | g2. | d2. |
  }
  
  % B section
  e2.:m | e2.:m | e2.:m | d2. |
  e2.:m | e2.:m | g4. d4. | e4.:m d4. |
  e2.:m | e2.:m | e2.:m | d2. |
  g2. | d4. g4. | e4.:m d4. | e4.:m
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
