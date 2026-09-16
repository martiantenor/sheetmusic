\version "2.18.2"

\language "english"		%For note names like "eb" and "ds"
\include "articulate.ly"	%For more musical MIDI output

\paper {
  indent = 0
  print-all-headers = ##t
}

% \header {
%   title = "The High Hills of Tara"
%   subtitle = ""
%   composer = "Irish trad.?"
%   arranger = "https://thesession.org/tunes/2998/16152"
%   meter = ""
% }

tunehighhillsoftara = \relative c'' {
  \key g \major
  \time 4/4
  \tempo "barndance" 4 = 120

  % A section
  \repeat volta 2 {
  \partial 4 \tuplet 3/2 {a8 b c} |
  d4 g,4~ g8. a16 \tuplet 3/2 {b8 a g} | c4 e,4 e a8. g16 |
  fs4 \tuplet 3/2 {g8 a b} c4 \tuplet 3/2 {b8 c d} |
  e8. g,16 cs8. e16 d8. g,16 \tuplet 3/2 {a8 b c} |
  d4 g, d8. b'16  a8. b16 | c4 e,4 e4~ e8. g16 |
  fs8. g16 a8. b16 c8. d,16 fs8. g16 | \tuplet 3/2 {a8 b a} g8. fs16 g4 |
  }
  
  % B section
  \break
  \repeat volta 2 {
  \partial 4 b8. d16 |
  g8. g,16 \tuplet 3/2 {g8 g g} fs'8. fs,16 \tuplet 3/2 {fs8 fs fs} |
  e'8. fs16 e8. d16 a4 \tuplet 3/2 {b8 a g} | fs4 \tuplet 3/2 {g8 a b} c4 \tuplet 3/2 {b8 c d} |
  e8. g,16 cs8. e16 d8. g,16 b8. d16 | g4 g,4 fs'4 fs,4 |
  e'4 \tuplet 3/2 {fs8 e d} a4~ a8. g16 | fs8. g16 a8. b16 c4 \tuplet 3/2 {d,8 e fs} |
  a4 d,4 g4
  }
}

chordshighhillsoftara = \chordmode {
}

\score {
  \header {
    title = "The High Hills of Tara"
    arranger = "arr. ceolachan, https://thesession.org/tunes/2998/16152"
    composer = "Irish trad.?"
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordshighhillsoftara
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
        \tunehighhillsoftara
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
          \tunehighhillsoftara
        }
      }
    >>
  >>
  \midi {
    \tempo 4 = 120
  }
}