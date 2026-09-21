#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Banish Misfortune"
  arranger = "arr. Jeremy, https://thesession.org/tunes/9"
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
  \repeat volta 2 {
    fs8 e d c a g  | a4 d8 c a g | fs4 d8 d e d | fs e fs g fs g |
    a g a c a g | a g a c d e | 
    fs e d c a g | a d cs d4. |
  }
 
  % B section
  \repeat volta 2 {
    fs4 d8 d cs d | fs4 g8 a g fs | e4 c8 c b c | e4 fs8 g fs e |
    fs4 g8 a g fs | e4 fs8 g fs e |
    fs e d c a g | a d cs d4. |
  }
  
  % C section
  \repeat volta 2 {
    fs4 g8 e4 fs8 | d4 e8 c4 d8 | a b a g a g | fs4 fs8 g e d |
    c'4. c8 a g | a g a c d e | 
    fs e d c a g | a d cs d4. |
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
    \tempo 4. = 90
  }
}
