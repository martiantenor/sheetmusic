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

tuneswallowtailjig = \relative c'' {
  \key a \dorian
  \time 6/8
  \tempo "double jig" 4.=75-130
  
  % A section
  \repeat volta 2 {
    c8 b a e' a, a | c b a e' d c | b g g d' g, g | g' fs e d c b |
    c b a e' a, a | c b a e'4 fs8 | g fs e d c b | c b a a4 d8 |
  }

 
  % B section
  \repeat volta 2 {
    e8 fs g a4 b8 | a4 b8 a g e | e fs g a4 b8 | a g e g4 d8 |
    e8 fs g a4 b8 | a4 b8 a g e | g fs e d c b | c b a a4 d8 |
  }
}

chordsswallowtailjig = \chordmode {

}

\score {
  \header {
    title = "The Swallowtail"
    arranger = "arr. Jeremy, https://thesession.org/tunes/106"
    composer = "Irish trad."
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordsswallowtailjig
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
        \tuneswallowtailjig
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
        \tuneswallowtailjig
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 120
  }
}