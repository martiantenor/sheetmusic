\version "2.18.2"

\language "english"		%For note names like "eb" and "ds"
\include "articulate.ly"	%For more musical MIDI output

\paper {
  indent = 0
  print-all-headers = ##t
}

% \header {
%   title = "King of the Fairies"
%   subtitle = ""
%   composer = "Irish trad."
%   arranger = "https://thesession.org/tunes/475#setting13361, converted to 12/8"
%   meter = ""
%   tagline = ""
% }

tunekingofthefairies = \relative c'' {
  \key e \dorian
  \time 12/8
  \tempo "hornpipe" 4. = 75-130

  % A section
  \partial 4.
  \repeat volta 3 {
    r4 b8 |
    e,4 ds8 e4 fs8 g4 fs8 g4 a8 | b4.~ b4 a8 g4 fs8 g4 a8 |
    b4 e,8 e e e e4 fs8 g fs e |
    fs4 g8 fs4 e8 d4.~ d4 b'8 |
    e,8\staccato r4 e4 fs8 g8\staccato r4 g4 a8 | b4 a8 g4 b8 d4.~ d4 c8 |
    b4. e,4. g8 fs4 e4 ds8 | e4. e e
  }

  %B section
  \repeat volta 1 {
    b'8 cs d |
    e4. b4.~ b4 d8 e4 fs8 | g4 a8 g4 fs8 e4 fs8 e4 ds8 | e4. b4. b4 as8 b4 cs8 | d4. d4 cs8 b4 cs8 d8 cs b |
    e4. b4. b8 cs d e4 fs8 | g4 a8 g4 fs8 e4 fs8 e4 d8 |
    b8 cs d e4 g8 fs4 e8 d e fs | e4.~ e4 ds8 e4. e4 fs8 |
    g4.~ g4 e8 fs4. fs4 d8 | e4 d8 b4 cs8 d4.~ d4 e8 | d4 b8 a4 g8 fs4 g8 a4 b8 | d4 b8 a4 fs8 g4 fs8 e4 d8 |
    b'4 e,8 e e ds e4 fs8 g4 a8 | b4. e4. e4 ds8 e4 fs8 |
    e4. b4.~ b4 a8 g4 fs8  | e4 e8[e e] e4s
  }

}

chordskingofthefairies = \chordmode {

  %A section
  \partial 4.
  \repeat volta 3 {
  s4. |
  e4.:m e4.:m e4.:m e4.:m | e4.:m e4.:m e4.:m e4.:m | e4.:m e4.:m e4.:m e4.:m | d4. d4. d4. d4. |
  e4.:m e4.:m e4.:m e4.:m | e4.:m e4.:m d4. d4. | e4.:m e4.:m d4. d4.  | e4.:m e4.:m e4.:m
  }
   
  %B section
  \repeat volta 1 {
  e4.:m | e4.:m e4.:m e4.:m e4.:m | e4.:m e4.:m e4.:m e4.:m | e4.:m e4.:m e4.:m e4.:m | d4. d4. d4. d4. |
  e4.:m e4.:m e4.:m e4.:m | e4.:m e4.:m e4.:m e4.:m | e4.:m e4.:m d4. d4. | e4.:m e4.:m e4.:m e4.:m |
  %g4. g4. d4. d4. | e4.:m e4.:m d4. d4. | g4. g4. d4. d4. | g4. g4. d4. d4. |
  g4. g4. d4. d4. | g4. g4. d4. d4. | g4. g4. d4. d4. | g4. g4. d4. d4. |
  e4.:m e4.:m e4.:m e4.:m | e4.:m e4.:m e4.:m e4.:m | e4.:m e4.:m d4. d4. | e4.:m e4.:m e4.:m 
  }

}

\score {
  \header {
    title = "King of the Fairies"
    arranger = "arr. ceolachan, https://thesession.org/tunes/475#setting13361, then converted to 12/8"
    composer = "Irish trad."
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordskingofthefairies
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
        \tunekingofthefairies
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
          \tunekingofthefairies
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 120
  }
}