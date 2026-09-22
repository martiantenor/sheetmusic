#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Picard's Ressikan Flute Song"
  subtitle = "From Star Trek: The Next Generation 'The Inner Light' (S5E25)"
  arranger = "transcribed by Dave Blair, 2018"
  piece = \markup { "in B" \smaller \flat \normalsize "(original key; starts on B" \smaller \flat \normalsize "5)" }
}

keytimetempo = {
  \time 3/4
  \key bf \major
  \tempo "moderato" 4=90
}

%{
chordNames = \chordmode {
  \global
}
%}

flutepart = \relative c''' {
  \keytimetempo
  \repeat volta 2 {
    %simple version: 
    %bf4.( c8 bf4 | ef2) ef4 | f2( \grace g8  bf4 | g2) \breathe ef4 |
    %first line with notes for 2nd playthrough:
    bf4.( c8 bf4 | ef2) ef4 | f2( \grace g8  bf4 | 
      << g2.) |
        \new Voice {
        \voiceTwo
        g2-"on rep."( ef4) |
        }
      >>
    f2( c'4 | bf2) af4 | \grace {g8 af} g2( ef4 | c2.) \breathe |
    bf4.( c8 bf4 | ef2) \breathe ef4 | f2( c'4 | \grace {bf8 c} bf2 c8 d8 |
    ef4. d8 c4 | d2 bf4 | g2. | f2) \breathe d4 |
  }

  %Coda w/o ritardando
  %bf4. c8 bf4 | ef4( c8 d ef g) | f2( bf4 | g2.\fermata) |
  %Coda with ritardando
  bf4. c8 bf4 |
  \override TextSpanner.bound-details.left.text = "rit."
  \textSpannerDown
  ef4( \startTextSpan c8 d ef g) | f2( bf4 | g2.\fermata)\stopTextSpan
}

%{
words = \lyricmode {
}
%}

\score {
  \header {
    \thisheader
  }
  <<
    \new Staff \with {
      %instrumentName = #"Ressikan Flute"
      instrumentName = \markup {
        \center-column { "Ressikan" \line {"flute"} }
      }
      shortInstrumentName = #"fl."
    }
    <<
      \clef "treble^15"
      \keytimetempo
      \accidentalStyle "modern"
      \new Voice = "melody" {
        \voiceOne
        \flutepart
      }
    >>
  >>
  \layout { }
}
\score {
  <<
    \new Staff \with {
      %instrumentName = #"Ressikan Flute"
      instrumentName = \markup {
        \center-column { "Ressikan" \line {"flute"} }
      }
      shortInstrumentName = #"fl."
    }
    <<
      \clef "treble^8"
      \key d \major
      \time 3/4
      \tempo "moderato" 4=90
      \accidentalStyle "modern"
      \new Voice = "melody" {
        \voiceOne
        \transpose bf d { \flutepart }
      }
    >>
  >>
  \layout { }
}


\score {
  <<
    \new Staff <<
      \set Staff.midiInstrument = #"flute"
      \new Voice {
        \unfoldRepeats \articulate {
          \flutepart %starts on a very high Bb5, as in the episode
          %\transpose bf bf, { \flutepart } %Bb4 / normal Bb whistle
          %\transpose bf d { \flutepart } %D5 / tin whistle
          %\transpose bf d, { \flutepart } %low D4 / flute
          %\transpose bf f, { \flutepart } %low F4 / alto F whistle
        }
      }
    >>
  >>
  \midi { 
    \tempo 4 = 80
  }
}
