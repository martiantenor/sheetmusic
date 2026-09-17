#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

headerbutterfly = % \header {
  title = "The Butterfly"
  subtitle = ""
  composer = "Irish trad."
  arranger = "https://thesession.org/tunes/10#setting10"
  meter = ""
  tagline = ""
}

keytimetempo = {
  \key e \minor
  \time 9/8
  \tempo "slip jig" %4. = 75-130
}

tunebutterfly = \relative c'' {
  \keytimetempo
  
  % A section
  \repeat volta 2 {
    b4 e,8 g4 e8 fs4. | b4 e,8 g4 e8 fs8( e d) |
    b'4 e,8 g4 e8 fs4. | b4 d8 d4 b8 a8( fs d) |
  }

  % B section
  \repeat volta 2 {
    b'4 d8 e4 fs8 g4. | b,4 d8 g4 e8 d8( b a) |
    b4 d8 e4 fs8 g4 a8 | b4 a8 g4 e8 d8( b a) | 
    
  }
  
  % C section
  \repeat volta 2 {
    b4. b4 a8 g4 a8 | b4. b8 a b d b a |
    b4. b4 a8 g4 a8 | b4 d8 g4 e8 d b a |
  }
}

chordsbutterfly = \chordmode {
}

\score {
  \header {
    \headerbutterfly
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordsbutterfly
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
        \tunebutterfly
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
          \tunebutterfly
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 80
  }
}
