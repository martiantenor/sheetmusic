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

tuneswallowtailjigedor = \relative c' {
  \key e \dorian
  \time 6/8
  \tempo "double jig" 4.=75-130
  
  % A section
  \repeat volta 2 {
    g'8 e e b' e, e | g e e b' a g | fs d d a' d, d | d' cs d a g fs |
    g e e b' e, e | g e g b4 cs8 | d cs d a g fs | g e e e4. |
  }

 
  % B section
  \repeat volta 2 {
    b'8 cs d e4 fs8 | e4 fs8 e d b | b cs d e4 fs8 | e d b d4. |
    b8 cs d e4 fs8 | e4 fs8 e d b | d cs d a g fs | g e e e4. |
  }
  
}

chordsswallowtailjigedor = \chordmode {

}

\score {
  \header {
    title = "The Swallowtail"
    arranger = "arr. fidicien, https://thesession.org/tunes/106"
    composer = "Irish trad. / New England"
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordsswallowtailjigedor
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
        \tuneswallowtailjigedor
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
        \tuneswallowtailjigedor
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 120
  }
}