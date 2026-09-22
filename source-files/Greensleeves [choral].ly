#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Greensleeves"
  composer = "English trad., 16th century melody"
  date = ""
  maintainer = "Steve Dunlop"
  maintainerWeb = "mutopiaproject.org"
  license = "Public Domain"
  style = "Hymn"
  source = "www.cyberhymnal.org"
}

keytimetempo = {
  \key g \major
  \time 6/8
  \tempo 8 = 160
}

soprano = { \relative c' {
  \partial 8 e8 
  g4 a8 b8. c16 b8    a4 fs8 d8. e16 fs8    g4 e8 e8. ds16 e8    fs4. b,4 e8   
  g4 a8 b8. c16 b8    a4 fs8 d8. e16 fs8    g8. fs16 e8 ds8. cs16 ds8    e4. e4 r8   
  d'4. d8. cs16 b8    a4 fs8 d8. e16 fs8    g4 e8 e8. ds16 e8    fs4 ds8 b4 r8   
  d'4. d8. c16 b8    a4 fs8 d8. ( e16 ) fs8    g8. fs16 e8 ds8. cs16 ds8    e4. e4 s8  \bar "|." }}

alto = { \relative c' {
  \partial 8 b8 
  e4 d8 d8. c'16 g8    fs4 d8 d8. e16 c8    b4 b8 a8. ds16 e8    ds4. b4 b8
  e4 d8 d8. c'16 g8    fs4 d8 d8. e16 c8    b8. fs'16 c8 b8. cs16 b8    b4. b4 r8
  fs'4. b8. a16 g8    fs4 d8 d8. e16 c8    b4 b8 a8. ds16 e8    ds4 b8 b4 r8
  fs'4. b8. a16 g8    fs4 d8 d4 c8    b8. fs'16 c8 b8. cs16 b8    b4. b4 s8  \bar "|." }}

tenor = { \relative c' {
  \partial 8 g8 
  b4 a8 g4 b8 | d d a fs4 a8 | g4 g8 a4 e8 | b'4. b4 g8 | 
  b4 a8 g4 b8 | d4 a8 fs4 a8 | g4 a8 fs4 fs8 | g4. g4 r8 |
  b4. d4 d8 | d4 a8 fs4 a8 | g4 g8 a4 e8 | b'4 fs8 b4 r8 |
  b4. d4 d8 | d4 a8 fs4 a8 | g4 a8 fs4 fs8 | g4. g4 s8  \bar "|." }}

bass = { \relative c {
  \partial 8 e8 
  e4 fs8 g4 g8 | d4 d8 d4 ds8 | e4 e8 c4 c8 | b4. b4 e8 |
  e4 fs8 g4 g8 | d d d d4 fs8 | e4 a,8 b4 b8 | e4. e4 r8 |
  b'4. g4 g8 | d4 d8 d4 ds8 | e4 e8 c4 c8 | b4 b8 b4 r8 |
  b'4. g4 g8 | d d d d4 ds8 | e4 a,8 b4 b8 | e4. e4 s8  \bar "|." }}

S = {
  %\keytimetempo
  a8 a a a a a
}

A = {
  %\keytimetempo
  fs8 fs fs fs fs fs
}

T = {
  %\keytimetempo
  d8 d d d d d
}

B = {
  %\keytimetempo
  g,8 g g g g g
}

\score {
  \header {
    \thisheader
  }
  \new ChoirStaff <<
    \new Staff <<
      \clef "treble"
      \keytimetempo
      \new Voice = "S" {
        \voiceOne
        \soprano
      }
      \new Voice = "A" {
        \voiceTwo
        \alto
      }
    >>
    \new Staff <<
      \clef "bass"
      \keytimetempo
      \new Voice = "T" {
        \voiceThree
        \tenor
      }
      \new Voice = "B" {
        \voiceFour
        \bass
      }
    >>
  >>
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
          \soprano
        }
      }
    >>
  >>
  \midi {
    \tempo 8 = 160
  }
}

% -- ABC Source file follows --
%X:1
%T:Greensleeves
%M:6/8
%L:1/8
%C:Traditional; 16th Century English melody
%Q:1/4=70
%F:greensleeves.abc
%N:Public domain
%G
%S:From www.cyberhymnal.org and crosschecked against other sources
%K:G
%I:Partial=8 Title=What Child is This
%V:1
%E2G4A2B3c1B2A4F2D3E1F2G4E2E3^D1E2F6B,4E2G4A2B3c1B2A4F2D3E1F2G3F1E2^D3^C1^D2E6E4z2d6d3^c1B2A4F2D3E1F2G4E2E3^D1E2F4^D2B,4z2d6d3=c1B2A4F2D3-E1F2G3F1E2^D3^C1^D2E6E4
%V:2
%B,2E4D2D3c1G2F4D2D3E1C2B,4B,2A,3^D1E2^D6B,4B,2E4=D2D3c1G2F4D2D3E1C2B,3F1C2B,3^C1B,2B,6B,4z2F6B3A1G2F4=D2D3E1=C2B,4B,2A,3^D1E2^D4B,2B,4z2F6B3A1G2F4=D2D4C2B,3F1C2B,3^C1B,2B,6B,4
%V:3
%G,2B,4A,2G,4B,2=D2-D2A,2F,4A,2G,4G,2A,4E,2B,6B,4G,2B,4A,2G,4B,2D4A,2F,4A,2G,4A,2F,4F,2G,6G,4z2B,6D4D2D4A,2F,4A,2G,4G,2A,4E,2B,4F,2B,4z2B,6D4D2D4A,2F,4A,2G,4A,2F,4F,2G,6G,4
%V:4
%E,2E,4F,2G,4G,2D,4D,2D,4^D,2E,4E,2C,4C,2B,,6B,,4E,2E,4F,2G,4G,2=D,2-D,2D,2D,4F,2E,4A,,2B,,4B,,2E,6E,4z2B,6G,4G,2D,4D,2D,4^D,2E,4E,2C,4C,2B,,4B,,2B,,4z2B,6G,4G,2=D,2-D,2D,2D,4^D,2E,4A,,2B,,4B,,2E,6E,4
%E,2E,4F,2G,4G,2D,4D,2D,4^D,2E,4E,2C,4C,2B,,6B,,4E,2E,4F,2G,4G,2=D,2-D,2D,2D,4F,2E,4A,,2B,,4B,,2E,6E,4z2B,6G,4G,2D,4D,2D,4^D,2E,4E,2C,4C,2B,,4B,,2B,,4z2B,6G,4G,2=D,2-D,2D,2D,4^D,2E,4A,,2B,,4B,,2E,6E,4
