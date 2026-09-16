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

tunekesh = \relative c'' {
  \key g \major
  \time 6/8
  \tempo "double jig" 4.=75-130
  
  % A section
  \repeat volta 2 {
    g4. g8 a b | a4. a8 b d | e d d g d d | e d b d b a |
    g a g g a b | a b a a b d | e d d g d d | b a fs g4. |
  }

  %B section
  \repeat volta 2 {
    b4 b8 d4 d8 | e g e d b a | b4 b8 d b g | a b a a g a |
    b a b d cs d | e g e d b d | g fs g a g a | b g g g4. |
  }
  
}

chordskesh = \chordmode {
}

\score {
  \header {
    title = "The Kesh"
    arranger = "arr. Jeremy, https://thesession.org/tunes/55"
    composer = "Irish trad."
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordskesh
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
        \tunekesh
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
          \tunekesh
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 120
  }
}