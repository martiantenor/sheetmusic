#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "A Fig for a Kiss"
  subtitle = ""
  composer = "Irish trad."
  arranger = "https://thesession.org/tunes/750, Josh Kane"
  meter = ""
  tagline = ""
}

keytimetempo = {
  \key e \minor
  \time 9/8
  \tempo "slip jig" 4. = 75-130
}

thistune = \relative c'' {
  \keytimetempo
  
  % A section
  \repeat volta 2 {
    g4 b8 e,4 b'8 b a g | fs4 a8 d,4 a'8 a g fs |
    g4 b8 e,4 b'8 b a g |
  }
  \alternative {
    {
      b16 cs d8 b a g fs d e fs |
    }
    {
      b16 cs d8 b a g fs e4. |
    }
  }
  
  % B section
  \repeat volta 2 {
    g'4 e8 \grace fs16 g4 e8 e d b |
    \grace e16 fs4 d8 d cs d fs e d
  }
  \alternative {
    {
      g4 e8 \grace fs16 g4 e8 e d b | d b g g b d e4 fs8 |
    }
    {
      g8 fs e fs e d e cs a | b16 cs d8 b a g fs e4 fs8 |
    }
  }
}

thesechords = \chordmode {
  % A section
  \repeat volta 2 {
    e4.:m e4.:m e4.:m | d4. d4. d4. | e4.:m e4.:m e4.:m |
  }
  \alternative {
    {
      e4.:m d4. d4. | 
    }
    {
      e4.:m d4. e4.:m |
    }
  }
  % B section
  \repeat volta 2 {
    e4.:m e4.:m e4.:m | d4. d4. d4. | 
  }
  \alternative {
    {
      e4.:m e4.:m e4.:m | d4. d4. d4. |
    }
    {
      e4.:m d4. e4.:m | e4.:m d4. e4.:m |
    }
  }
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
    \tempo 4 = 80
  }
}
