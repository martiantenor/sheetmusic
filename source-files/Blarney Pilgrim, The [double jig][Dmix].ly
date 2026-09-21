#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "The Blarney Pilgrim"
  arranger = "arr. Jeremy, https://thesession.org/tunes/5"
  composer = "Irish trad."
}

keytimetempo = {
  \key d \major
  \time 6/8
  \tempo "double jig" 4.=75-130
}

thistune = \relative c' {
  \keytimetempo
  
  % A section
  \repeat volta 2 {
    d8 e d d e g | a4 a8 a b cs | b a g a g e | g e a g e d |
    d8 e d d e g | a4 a8 a b cs | b a g a g e | g e d d4. |
  }

 
  % B section
  \repeat volta 2 {
    d'8 e d d b g | a g a b g e | d' e d d b g | a g a g a b |
    g'4 e8 d b g | a g a b g e | b'4 g8 a g e | g a g g4. |
  }

  % C section
  \repeat volta 2 {
    a4 d,8 b'4 d,8 | a'4 d,8 a' b cs | b a g a g e | g e a g e d |
    a' d, d b' d, d | a' d, d a' b cs | b a g a g e | g e d d4. |
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
