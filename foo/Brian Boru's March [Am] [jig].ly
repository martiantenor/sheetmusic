\version "2.18.2"

\language "english"		%For note names like "eb" and "ds"
\include "articulate.ly"	%For more musical MIDI output

\paper {
  indent = 0
  print-all-headers = ##t
}

% \header {
%   title = "Brian Boru's March"
%   subtitle = ""
%   composer = "Irish trad."
%   arranger = "www.flutetunes.com"
%   meter = ""
%   tagline = ""
% }

tunebrianboru = \relative c'' {
  \key a \minor
  \time 6/8
  \tempo "jig" 4. = 75-130

  % A section
  \partial 8
  \repeat volta 2 {
    e8 | c8. b16 a8 a4 e'8 | c8. b16 a8 a4 d8 | b8. a16 g8 g4 d'8 | b8. a16 g8 g4 e'8 |
    c8. b16 a8 a4 e'8 | c8. b16 a8 a4 a8 | a8. c16 d8 e4 d8 | c8 b a a4 | \break
  }

  %B section
  \partial 8
  \repeat volta 2 {
    r8 | g8 c d e4 d8 | e4 d8 e4 d8 |
    g,8 a b d4 b8 | d4 b8 d4 b8 |
    a8. c16 d8 e4 d8 | e4 d8 e4 d8 | a8. c16 d8 e4 d8 | c8 b a a4 | \break
  }

  %C section
  \partial 8
  \repeat volta 2 {
    r8 | c8 b a a'4 a8 | c,8 b a a'4 a8 | b,8 a g g'4 g8 | b,8 a g g'4 g8 |
    c,8 b a a'4 a8 | c,8 b a a'4 a8 | a,8 c d e4 d8 | c8 b a a4 |
  }

}

chordsbrianboru = \chordmode {
}

\score {
  \header {
    title = "Brian Boru's March"
    composer = "Irish trad."
    arranger = "www.flutetunes.com"
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordsbrianboru
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
        \tunebrianboru
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
          \tunebrianboru
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 80
  }
}