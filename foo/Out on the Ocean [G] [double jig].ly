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

tuneoutontheocean = \relative c'' {
  \key d \mixolydian
  \time 6/8
  \tempo "double jig" 4.=75-130
  
  % A section
  \repeat volta 2 {
    \partial 4 { g8 e | }
    d4 b'8 b a g | b d b a4 b8 | g e d g4 a8 | b4 b8 a g e |
    d4 b'8 b a g | b d b a4 b8 | g e d g4 a8 | b8 g e g
  }
 
  % B section
  \repeat volta 2 {
    \partial 4 { b8 d | }
    e4 e8 e d b | e g e e d b | d4 b8 d e fs | g fs e d b a |
    g4 a8 b4 d8 | e g e d4 b8 | a g e g4 a8 | b g e g |
  }
  
}

chordsoutontheocean = \chordmode {
  
  % A section
  \repeat volta 2 {
    \partial 4 { s4 | }
    g2. | g2. | c2. | d2. | g2. | g2. | c2. | d4. g8 
  }
 
  % B section
  \repeat volta 2 {
    \partial 4 { s4 }
    e2.:m | e2.:m | b2.:m7 | c2. | g2. | c2. | g2. | d4. g8
    
  }
  
}

\score {
  \header {
    title = "Out on the Ocean"
    arranger = "arr. Jeremy & Rick Dyer, https://thesession.org/tunes/108"
    composer = "Irish trad."
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordsoutontheocean
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
        \tuneoutontheocean
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
        \tuneoutontheocean
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 120
  }
}