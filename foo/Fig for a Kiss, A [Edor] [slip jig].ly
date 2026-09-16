\version "2.18.2"

\language "english"		%For note names like "eb" and "ds"
\include "articulate.ly"	%For more musical MIDI output

\paper {
  indent = 0
  print-all-headers = ##t
}

% \header {
%   title = "A Fig for a Kiss"
%   subtitle = ""
%   composer = "Irish trad."
%   arranger = "https://thesession.org/tunes/750, Josh Kane"
%   meter = ""
%   tagline = ""
% }


tunefigforakiss = \relative c'' {
  \key e \minor
  \time 9/8
  \tempo "slip jig" 4. = 75-130
  
  % A section
  \repeat volta 2 {
    g4 b8 e,4 b'8 b a g | fs4 a8 d,4 a'8 a g fs |
    g4 b8 e,4 b'8 b a g |
  }
  \alternative {
    {
      b16 cs d8 b a g fs d e fs |
    }
    {
      b16 cs d8 b a g fs e4. |
    }
  }
  
  % B section
  \repeat volta 2 {
    g'4 e8 \grace fs16 g4 e8 e d b |
    \grace e16 fs4 d8 d cs d fs e d
  }
  \alternative {
    {
      g4 e8 \grace fs16 g4 e8 e d b | d b g g b d e4 fs8 |
    }
    {
      g8 fs e fs e d e cs a | b16 cs d8 b a g fs e4 fs8 |
    }
  }
}

chordsfigforakiss = \chordmode {
  % A section
  \repeat volta 2 {
    e4.:m e4.:m e4.:m | d4. d4. d4. | e4.:m e4.:m e4.:m |
  }
  \alternative {
    {
      e4.:m d4. d4. | 
    }
    {
      e4.:m d4. e4.:m |
    }
  }
  % B section
  \repeat volta 2 {
    e4.:m e4.:m e4.:m | d4. d4. d4. | 
  }
  \alternative {
    {
      e4.:m e4.:m e4.:m | d4. d4. d4. |
    }
    {
      e4.:m d4. e4.:m | e4.:m d4. e4.:m |
    }
  }
}

\score {
  \header {
    title = "A Fig for a Kiss"
    arranger = "arr. Josh Kane, https://thesession.org/tunes/750"
    composer = "Irish trad."
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordsfigforakiss
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
        \tunefigforakiss
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
          \tunefigforakiss
        }
      }
    >>
  >>
  \midi {
    \tempo 4 = 80
  }
}