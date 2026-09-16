\version "2.18.2"

\language "english"		%For note names like "eb" and "ds"
\include "articulate.ly"	%For more musical MIDI output

\paper {
  indent = 0
  print-all-headers = ##t
}

#(define-markup-command (ezscore layout props mus) (ly:music?)
  #:properties ((size 0))
  (interpret-markup layout props
    #{
      \markup {
        \score {
          \new RhythmicStaff { $mus }
          \layout {
            \context {
              \RhythmicStaff
              \remove Clef_engraver
              \remove Time_signature_engraver
              \omit StaffSymbol
              fontSize = #size
              \override StaffSymbol.staff-space = #(magstep size)
              \override StaffSymbol.thickness = #(magstep size)
            }
            indent = 0
          }
        }
      }
    #}
  )
)



tunejohnbrownsbody = \relative c' {
  \key g \major
  \time 4/4
%   \tempo \markup {
%     (
%     \ezscore ##{ \small c8.[ c16] #}
%     "= "
%     )
%   }

  \tempo \markup {
    "swung march" (
    \score {
      \new RhythmicStaff { \override Stem.length = 5.6
        \tiny c8.[ c16]
      }
      \layout {
        \context {
          \RhythmicStaff
          \remove Clef_engraver
          \remove Time_signature_engraver
          \omit StaffSymbol
          fontSize = 0.0

        }
      }
    }
    " = "
    \score {
      \new RhythmicStaff { 
        \tiny \tuplet 3/2 {c8~ c c}
      }
      \layout {
        \context {
          \RhythmicStaff
          \remove Clef_engraver
          \remove Time_signature_engraver
          \omit StaffSymbol
          fontSize = 0.0
        }
      }
    }
    )
  }

  % Verse
  \partial 16 d16
  d8. d16 d8. c16 b8. d16 g8. a16 | b8. b16 b8. a16 g4 g8. fs16 |
  e8. e16 e8. fs16 g8. fs16 g8. e16 | d8. e16 d8. b16 d4~d8. d16 |
  d8. d16 d8. c16 b8. d16 g8. a16 | b8. b16 b8. a16 g4 g4 |
  a a g fs | g2. r4 |

  % Chorus
  d4~d8. c16 b8. d16 g8. a16 | b4~b8. a16 g4 g8. fs16 |
  e4~~e8. fs16 g8. fs16 g8. e16 | d4. c8 b4~b8 d8 |
  d4~d8. c16 b8. d16 g8. a16 | b4~b8. a16 g4 g4 |
  a a g fs | g2. r4 |

}

chordsjohnbrownsbody = \chordmode {
  \partial 16 s16
  g2 g2 | g2:7 g2:7/b |
  c2 c2 | g2 d2:7 |
  g2 g2:7 | b2:7 e2:m |
  a2:m d4:sus4 d4 | g2 g2
  
  g2 g2 | g2:7 g2:7/b |
  c2 c2 | g2 g2 |
  g2 g2:7/f | b2:7/ds e2:m |
  a2:m d4:sus4 d4 | g1
}


lyricsOne = \lyricmode {
  \set stanza = #"1."
}

lyricsTwo = \lyricmode {
  \set stanza = #"2."
}

\score {
  \header {
    title = "John Brown's Body"
    composer = "music: American trad. (c.1800-1850) / lyrics: Union soldiers, c. 1861"
    arranger = "chords: tabs.ultimate-guitar.com"
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \transpose d a \chordsjohnbrownsbody
      %\chordsjohnbrownsbody
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
      \new Voice = "melody" {
        \transpose d a {\tunejohnbrownsbody}
        %\tunejohnbrownsbody
      }
%     \new Lyrics {
%       \lyricsto "melody" {
%         \lyricsOne
%       }
%     }
%     \new Lyrics {
%       \lyricsto "melody" {
%         \lyricsTwo
%       }
%     }
    >>
  >>
  \layout { }
}

% \markup {
%   \vspace #1.5 % adds a break before lyrics
%   \fill-line {
%   %     \hspace #0.1 % moves the column off the left margin;
%   %      % can be removed if space on the page is tight
%     \column {
%       \line { \bold "1."
%         \column {
%         }
%       }
%     %\combine \null \vspace #0.1 % adds vertical spacing between verses
%     }
%     %\hspace #0.1 % adds horizontal spacing between columns;
%     \column {
%       \line { \bold "2."
%         \column {
%         }
%       }
%     }
%   }
%   %\hspace #0.1 % gives some extra space on the right margin;
%   % can be removed if page space is tight
% }

\score {
  <<
    %}
    \new Staff <<
      \set Staff.midiInstrument = #"voice oohs"
      \new Voice {
        \unfoldRepeats \articulate {
          %\tunejohnbrownsbody
          \transpose d a { \tunejohnbrownsbody }
        }
      }
    >>
    \new Staff <<
      \set Staff.midiInstrument = #"acoustic grand"
      \new Voice {
        \unfoldRepeats \articulate {
          %\chordsjohnbrownsbody
          \transpose d a, { \chordsjohnbrownsbody }
        }
      }
    >>

  >>
  \midi {
    \tempo 4 = 80
  }
}