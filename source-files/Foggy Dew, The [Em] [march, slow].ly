#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

headerfoggydew = \header {
    title = "The Foggy Dew"
    subtitle = ""
    composer = "Irish trad."
    arranger = ""
    meter = ""
    tagline = ""
}

tunefoggydew = \relative c'' {
  \key e \minor
  \time 4/4
  \tempo "march" 4 = 80
  
  \partial 4 b8 d8 |
  \repeat volta 2 {
    e4 d8 b8 e4 d8 b8 | a4 b4 d,4 e8 fs8 | g8 b a g e4 d4 |
  }
  \alternative {
    { e2. b'8 d8 }
    { e,2. d4 }
  }
  
  g4. b8 d4 c8 b8 | a4 a b g8 a | b4 g'8 fs e d b d | e2. b8 d8 |
  e4 d8 b e4 d8 b | a4 b4 d,4 e8 fs8 | g8 b a g e4 d4 | e2. r4 |
  
}

chordsfoggydew = \chordmode {
}

\score {
  \header {
    \headerfoggydew
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordsfoggydew
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
        \tunefoggydew
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
          \tunefoggydew
        }
      }
    >>
  >>
  \midi {
    \tempo 4 = 80
  }
}
