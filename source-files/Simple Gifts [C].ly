#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Simple Gifts"
  composer = "Shaker trad. / Joseph Brackett (1848)"
  arranger = "https://en.wikipedia.org/wiki/Simple_Gifts"
  tagline = ""
}

keytimetempo = {
  \key c \major
  \time 4/4
  \tempo "quick dance" 4=100
  \numericTimeSignature %use "4/4" instead of "C"

  %\clef "treble_8"
  %\set strokeFingerOrientations = #'(down up)
  %\override Fingering.staff-padding = #'()
  %\override TupletBracket.bracket-visibility = ##t
}

melody = \relative c'' {
  \partial 2 { g4 g }
  c4 c8 d e c e f | g4 g8 g e4 d8 c |
  d4 d d d | d8 e d b g4 g |
  c8 b c d e4 d8 d | e4 f g4. g8 |
  d4 d8 e d4 c8 c | d4 c8 b c2 | \section \break

  g'2 e4. d8 | e8 f e d c4. d8 |
  e4 e8 f g4 e | d d8 e d4. g,8 |
  c2 c4. d8 | e4 e8 f g4 g8 g |
  d4 d e e8 d | c4 c c2 | \section \break
}

thesechords = \chordmode {
}

thelyrics = \lyricmode {
  'Tis the gift to be sim -- ple, 'tis the gift to be free
  'Tis the gift to come down where we ought to be,
  And when we find our -- selves in the place just right,
  'Twill be in the val -- ley of love and de -- light.

  When true sim -- pli -- ci -- ty is gained,
  To bow and to bend we shan't be a -- shamed,
  To turn, turn will be our de -- light,
  Till by turn -- ing, turn -- ing, we come 'round right.
}

%tuneflattened = \absolute {
%}

\score {
  \header {
    \thisheader
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \thesechords
    }
    \new Staff <<
      \keytimetempo
      \accidentalStyle "modern"
      \new Voice = "melody" {
        \melody
      }
      \new Lyrics \lyricsto "melody" {
        \thelyrics
      }
    >>
  >>
  \layout { }
}

\score {
  %{
  \new Staff {
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
    \accidentalStyle "modern"
    \keytimetempo
    \unfoldRepeats \articulate {
      \thismelody
    }
  }
  %}
  \new Staff <<
    \set Staff.midiInstrument = #"violin"
    \new Voice {
      \unfoldRepeats \articulate {
        \melody
      }
    }
  >>
  \midi {
    \tempo 4 = 100
  }
}
