#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Cuilfhionn"
  composer = "Old Blind Dogs (from the album \"Fit?\")"
  arranger = "Irish trad.? Or totally different song?"
  subtitle = ""
  meter = ""
  tagline = ""
}

keytimetempo = {
  \key a \dorian
  \time 2/4
  \tempo "air" 4=63
}

thistune = \relative c'' {
  \keytimetempo

  % this is the loop that never ends...
  \repeat segno 2 {
    % A section
    \repeat volta 2 {
      \bar ".|:"
      a4 b16 a g a | b8 a a e'16 d | b8 a16 g e'8 d16 b | d8. g,16 g8 \tuplet 3/2 {d16 e g } |
      a4 b16 a g a | b8 a a e'16 d | b8 a16 g e'8 d16 b | 
      \alternative {
          { e8 a, a \tuplet 3/2 {d,16 e g } | }
          { e'8 a, a b16 d | }
      }
    }

    %%B section
    \repeat volta 2 {
      e8 d16 e g8 fs16 g | a8 e16 a g8 e16 a | e8 d16 e g8 e16 g | e16 d b a g8 b16 d |
      \alternative {
        { e8 d16 e g8 fs16 g | a8 e16 a g8 e16 a | 
          g8 e16 a g e d b | e8 a, a b16 d |
        }
        { d8 c16 d e8 d16 e | g8 fs16 g a8 e16 a |
          g8 e16 a g e d b | e8 a, a \tuplet 3/2 { d,16 e g } |
        }
      }
    }
  }
}

thesechords = \chordmode {
}

\score {
  \header {
    \thisheader
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \thesechords
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
        \thistune
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
          \thistune
        }
      }
    >>
  >>
  \midi {
    \tempo 4. = 120
  }
}
