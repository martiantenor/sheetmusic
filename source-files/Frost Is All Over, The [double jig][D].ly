#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "The Frost Is All Over / Kitty Lie Over"
  composer = "Irish trad."
  arranger = "arr. The Chieftains & The Punch Brothers, from album \"Voice of Ages\""
}

keytimetempo = {
  \key d \major
  \time 6/8
  \tempo "double jig" 4=125
  \numericTimeSignature %use "4/4" instead of "C"
}

thistunePartA = \relative c'' {
  \keytimetempo
  \bar ".|:"
  \repeat volta 2 {
    a8 d, d d d fs | a b d b4 a8 | a b a fs fs fs | g fs g e4. |
    a8 d, d d d fs | a b d b4 a8 |
    \alternative {
      { a b a fs e e | fs d d d4 a'8 | }
      { a b a fs e e | fs d d d4 e'8 | }
    }
  }
}

thistunePartB = \relative c'' {
  \repeat volta 2 {
    fs8 d d e d d | fs d cs d4 fs8 | fs fs\mordent fs d e fs | g g\mordent g e fs g |
    fs e d b4\mordent a8 | a g fs g4\mordent b8 |
    \alternative {
      { a b a fs e e | fs d d d4 e'8 | }
      { a, b a fs e e | fs d d d4. | }
    }
  }
}

verseOne = \lyricmode {
  What would you do if the ket -- tle boiled o -- ver?
  What would I do but to fill it a -- gain
  What would you do if the cows eat the clo -- ver?
  What would I do but to set it a -- gain
  The pra -- ties are dug and the frost is all o -- ver
  Ki -- tty lie o -- _ ver close to the wall
  How would you like to be married to a sol -- dier?
  Ki -- tty lie o -- _ ver close to the wall
}

verseTwo = \lyricmode {
  What would you do if you mar -- ried a sol -- dier?
  What would I do on -- ly fol -- low his gun
  What would you do if he died on the o -- cean?
  What would I do on -- ly mar -- ry a -- gain
  The pra -- ties all boil and the herr -- ings are roast -- ed
  Ki -- tty lie o -- _ ver close to the wall
  You to be drunk _ and I to be so -- ber
  Ki -- tty lie o -- _ ver close to the wall
}

verseThree = \lyricmode {
  What would you do if the ket -- tle boiled o -- ver?
  What would I do but to fill it a -- gain
  What would you do if the cows eat the clo -- ver?
  What would I do but to set it a -- gain
  The pra -- ties are dug and the frost is all o -- ver
  Ki -- tty lie o -- _ ver close to the wall
  How would you like to be married to a sol -- dier?
  Ki -- tty lie o -- _ ver close to the wall
}

\score {
  \header {
    \thisheader
  }
  <<
    %{
    \new ChordNames {
      \set chordChanges = ##t
      \thesechords
    }
    %}
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
        \voiceOne
        \repeat volta 3 {
          \unfoldRepeats {
            \thistunePartA
          }
          \thistunePartB
        }
      }
      \new Lyrics \lyricsto "melody" {
        \verseOne
      }
      \new Lyrics \lyricsto "melody" {
        \verseTwo
      }
      \new Lyrics \lyricsto "melody" {
        \verseThree
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
          \thistunePartA
          \thistunePartB
        }
      }
    >>
  >>
  \midi {
    \tempo 4 = 125
  }
}
