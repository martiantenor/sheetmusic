#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "The Mug of Brown Ale"
  arranger = "https://thesession.org/tunes/888"
  composer = "Irish trad."
  subtitle = ""
  meter = ""
  tagline = ""
}

keytimetempo = {
  \key a \dorian
  \time 6/8
  \tempo "double jig" 4.=75-130
}

thistune = \relative c'' {
  \keytimetempo
  
  \partial 4 g'8 fs
  
  % A section
  \repeat volta 2 {
    e8 a, a fs' a, a | g'4.\mordent a8 g e | d b a g4 a8 | b4.\mordent d8 b d |
    e8 a, a fs' a, a | g'4.\mordent a8 g e | d b d g d b | b a g a4. |
  }

  %B section
  \repeat volta 2 {
    e'8 fs g a4.\mordent | a8 b a a g e | d b d g4.\mordent | g8 a g g e d |
    e8 fs g g4.\mordent | a8 b a a g e | d b d g d b | b a g a4. |

    % version with a high csharp!
    %e8 fs g a4.\mordent | a8 b a a g e | d b d g4.\mordent | g8 b a g e d |
    %e8 fs g g4.\mordent | a8 b a a g e | d b d g d b | a b a a b d |
    %e8 fs g a4.\mordent | a8 b a a g e | d b d g4.\mordent | g8 b a g e d |
    %e8 fs g a4 b8 | cs8 a cs a g e | d b d g d b | a b a a4. |
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
