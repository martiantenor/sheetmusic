
#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = ""
  subtitle = ""
  composer = ""
  arranger = ""
  meter = ""
  tagline = ""
}

keytimetempo = {
  \key c \major
  \time 4/4
  \tempo "Allegro"
}

thistune = \relative c {
  \keytimetempo
  %g8\6 as\6 c\5 d\5 g,\6 as\6 c\5 d\5 |
  %c\5 d\5 e\4 g\4 c,\5 d\5 e\4 g\4 |

  <g\6 c\5>8
}

thesechords = \chordmode {
}

\score {
  \header {
    \thisheader
  }
  <<
    %{
    \new ChordNames {
      \set chordChanges = ##t
      \thesechords
    }
    %}
    \new FretBoards {
      \set chordChanges = ##t
      \thistune
    }
    \new Staff <<
      \clef "G_8"
      \accidentalStyle "modern"
      \new Voice {
        \thistune
      }
    >>
    \new TabStaff {
      \thistune
    }
  >>
  \layout { \omit Voice.StringNumber }
}

\score {
  \new FretBoards {
    \thistune
  }
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
      \set Staff.midiInstrument = #"acoustic guitar (steel)"
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
