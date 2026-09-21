#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "The Earl's Chair"
  subtitle = ""
  composer = "Irish trad."
  arranger = "slainte, https://thesession.org/tunes/221"
  meter = ""
  tagline = ""
}

keytimetempo = {
  \key d \major
  \time 4/4
  \tempo "reel" 4 = 120
}

thistune = \relative c'' {
  \keytimetempo

  % A section
  \repeat volta 2 {
    b4 d8 b b a fs a | b4 d8 b b a fs b |
    a fs \tuplet 3/2 {fs fs fs} d8 fs \tuplet 3/2 {fs fs fs} | a8 fs d' b a d, fs a |
    b4 d8 b b a fs a | b4 d8 b b a fs b |
    a4. b8 d e fs d |
  }
  \alternative {
    {e8 d e fs d4. a8}
    {e'8 d e fs d4. fs8}
  }

  %B section
  \repeat volta 2 {
    e4 e8 fs d4 d8 fs8 | e8 d e fs d b a4 |
    e'4 e8 fs d cs d e | fs e d b a d, fs a |
    e'4 e8 fs d b \tuplet 3/2 {b b b} | g'8 b, \tuplet 3/2 {b b b} d e fs g |
    a8 fs b fs a fs e g | fs e d b a d, fs a |
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
    \tempo 4 = 120
  }
}
