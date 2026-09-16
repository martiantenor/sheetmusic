\version "2.18.2"

\language "english"		%For note names like "eb" and "ds"
\include "articulate.ly"	%For more musical MIDI output

\paper {
  indent = 0
  print-all-headers = ##t
}

% \header {
%   title = "The Kesh"
%   subtitle = ""
%   composer = "Irish trad."
%   arranger = "Jeremy, https://thesession.org/tunes/55"
%   meter = ""
%   tagline = ""
% }

colornotes = #(define-scheme-function
    (parser location color notes)
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

tunebanishmisfortune = \relative c'' {
  \key d \mixolydian
  \time 6/8
  \tempo "double jig" 4.=75-130
  
  % A section
  \repeat volta 2 {
    fs8 e d c a g  | a4 d8 c a g | fs4 d8 d e d | fs e fs g fs g |
    a g a c a g | a g a c d e | 
    \colornotes #darkgreen {
      fs e d c a g | a d cs d4. |
    }
  }
 
  % B section
  \repeat volta 2 {
    fs4 d8 d cs d | fs4 g8 a g fs | e4 c8 c b c | e4 fs8 g fs e |
    fs4 g8 a g fs | e4 fs8 g fs e |
    \colornotes #darkgreen {
      fs e d c a g | a d cs d4. |
    }
  }
  
  % C section
  \repeat volta 2 {
    fs4 g8 e4 fs8 | d4 e8 c4 d8 | a b a g a g | fs4 fs8 g e d |
    c'4. c8 a g | a g a c d e | 
    \colornotes #darkgreen {
      fs e d c a g | a d cs d4. |
    }
  }
  
}

chordsbanishmisfortune = \chordmode {
}

\score {
  \header {
    title = "Banish Misfortune"
    arranger = "arr. Jeremy, https://thesession.org/tunes/9"
    composer = "Irish trad."
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordsbanishmisfortune
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
        \tunebanishmisfortune
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
          \tunebanishmisfortune
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 90
  }
}