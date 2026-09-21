\version "2.24.0"

\language "english"		%For note names like "eb" and "ds"
\include "articulate.ly"	%For more musical MIDI output

\paper {
  indent = 0
  print-all-headers = ##t
}

colornotes = #(define-scheme-function
    (color notes)
    (list? ly:music?)
    #{
      \override NoteHead.color = $color
      \override Stem.color = $color
      \override Beam.color = $color
      \override Accidental.color = $color
      $notes
      \revert NoteHead.color
      \revert Stem.color
      \revert Beam.color
      \revert Accidental.color
    #}
)

tuneliltingbanshee = \relative c' {
  \key a \dorian
  \time 6/8
  \tempo "double jig" 4.=75-130
  
  % A section
  \repeat volta 2 {
    e8 a a e a a | b a b g4 a8 | b e e e d b | d e fs g fs g |
    e a, a e' a, a | b a b g4 a8 | b e e e d b | d b a a4. |
  }

 
  % B section
  \repeat volta 2 {
    e'8 a a a g e | d b a g4 a8 | b e e e d b | d e fs g fs g |
    e a a a g e | d b a g4 a8 | b e e e d b | d b a a4. |
  }
  
}

chordsliltingbanshee = \chordmode {

}

\score {
  \header {
    title = "The Lilting Banshee"
    arranger = "arr. Jeremy, https://thesession.org/tunes/60"
    composer = "Irish trad."
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordsliltingbanshee
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
        \tuneliltingbanshee
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
        \tuneliltingbanshee
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 120
  }
}