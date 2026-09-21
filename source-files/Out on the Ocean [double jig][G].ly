#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Out on the Ocean"
  arranger = "arr. Jeremy & Rick Dyer, https://thesession.org/tunes/108"
  composer = "Irish trad."
}

keytimetempo = {
  \key d \mixolydian
  \time 6/8
  \tempo "double jig" 4.=75-130
}

thistune = \relative c'' {
  \keytimetempo
  
  % A section
  \partial 4
  \repeat volta 2 {
    \bar ".|:"
    g8 e
    d4 b'8 b a g | b d b a4 b8 | g e d g4 a8 | b4 b8 a g e |
    d4 b'8 b a g | b d b a4 b8 | g e d g4 a8 | b8 g e g
  }
 
  % B section
  \partial 4
  \repeat volta 2 {
    b8 d
    e4 e8 e d b | e g e e d b | d4 b8 d e fs | g fs e d b a |
    g4 a8 b4 d8 | e g e d4 b8 | a g e g4 a8 | b g e g
  }
  
}

thesechords = \chordmode {
  
  % A section
  \repeat volta 2 {
    \partial 4 { s4 | }
    g2. | g2. | c2. | d2. | g2. | g2. | c2. | d4. g8 
  }
 
  % B section
  \repeat volta 2 {
    \partial 4 { s4 }
    e2.:m | e2.:m | b2.:m7 | c2. | g2. | c2. | g2. | d4. g8
    
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
    \tempo 4. = 120
  }
}
