#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Foxhunter's"
  subtitle = ""
  composer = "Irish trad."
  arranger = "Netallica, https://thesession.org/tunes/482"
  meter = ""
  tagline = ""
}

keytimetempo = {
  \key d \major
  \time 9/8
  \tempo "slip jig" 4. = 75-130
}


thistune = \relative c' {
  \keytimetempo
  
  % A section
  \repeat volta 2 {
    \bar ".|:"
    fs8 d fs fs4 d8 g4 e8 | fs8 d fs fs4 d8 e4 d8 |
    fs d fs fs4 d8 g4 b8 | a fs d d e fs e4 d8 | \break
  }
  
  % B section
  \repeat volta 2 {
    b'4. b8 a g fs g a | b4 e,8 e4 fs8 g4 b8 |
    a b cs d cs b a b cs | d4 d,8 d4 fs8 e4 d8 | \break
  }
  
  % C section
  \repeat volta 2 {
    fs'8 d fs fs4 d8 g4 e8 | fs8 d fs fs4 d8 e4 d8 |
    fs8 d fs fs4 d8 g4 b8 | a fs d d e fs e4 d8 | \break
  }
  
  % D section
  \repeat volta 2 {
    g8 fs e d cs b a g fs | b4 e,8 e4 fs8 g4 b8 |
    a8 b cs d cs b a b cs | d4 d,8 d e fs e4 d8 |
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
