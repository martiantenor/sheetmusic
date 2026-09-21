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

tuneconnaughtmansrambles = \relative c' {
  \key d \major
  \time 6/8
  \tempo "double jig" 4.=75-130
  
  % A section
  \repeat volta 2 {
    fs8 a a d a a | b a a d a g | fs a a d fs e | d b b b a g |
    fs8 a a d a a | b a a d e fs | g fs e d fs e
  }
  \alternative {
    { d8 b b b a g }
    { d'8 b b b4. }
  }
 
  % B section
  \repeat volta 2 {
    fs'8 b b fs a fs | fs e d e d e | fs b b fs a fs | fs e d e4. |
    fs8 b b fs a fs | fs e d d e fs | g fs e d fs e |
  }
  \alternative {
    { d8 b b b4. }
    { e8 b b b a g }
  }
  
}

chordsconnaughtmansrambles = \chordmode {

}

\score {
  \header {
    title = "The Connaughtman’s Rambles"
    arranger = "arr. Jeremy, https://thesession.org/tunes/19"
    composer = "Irish trad."
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordsconnaughtmansrambles
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
        \tuneconnaughtmansrambles
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
        \tuneconnaughtmansrambles
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 120
  }
}