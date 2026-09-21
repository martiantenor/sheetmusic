#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
    title = "The Foggy Dew"
    subtitle = ""
    composer = "Irish trad. / The Chieftains / Sinéad O'Connor"
    meter = ""
    tagline = ""
}

keytimetempo = {
  \key e \minor
  \time 4/4
  \tempo "march" 4 = 80
  \numericTimeSignature %use "4/4" instead of "C"
}

thistune = \relative c'' {
  \keytimetempo
  
  \partial 4 b8 d8 |
  \repeat unfold 2 {
    e4 d8 b8 e4 d8 b8 | a4 b4 d,4 e8 fs8 | g8 b a g e4. d8 |
  }
  \alternative {
    { e2. b'8 d8 }
    { e,2. d4 }
  }
  
  g4. b8 d4 c8 b8 | a4 a b g8 a | b4 g'8 fs e d b d | e2. b8 d8 |
  e4 d8 b e4 d8 b | a4 b4 d,4 e8 fs8 | g8 b a g e4 d4 | e2. r4 |

  \fine
  
}

%these chords aren't tested/correct!
thesechords = \transpose b e {
  \chordmode {

    r4
    \repeat unfold 2 {
      b1:m | b1:m | b2:m e2:m |
    }
    \alternative {
      { b1:m }
      { b1:m }
    }

    d1 | e2:m d2 | b1:m | b1:m |
    b1:m | e1:m | b2:m e2:m | b1:m |

  }
}

verseone = \lyricmode {

  As _ down _ the glen one _ Eas -- ter morn to a city _ _ _ fair rode I
  There _ armed _ _ lines of _ mar -- ching men in _ squa _ -- drons _ passed me by
  No pipe did hum, no _ bat -- tle drum did _ sound its _ dread _ ta _ -- too 
  But the An -- gel -- us Bells o'er the Liff -- ey swells rang _ out _ in the fog -- gy dew

}

%Additional verses entered at the bottom of the file

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
      \new Voice = "melody" {
        \thistune
      }
      \new Lyrics \lyricsto "melody" {
        \verseone
      }
    >>
  >>
  \layout { }
}

%Additional verses
\markup \column \string-lines
  "Right proudly high in Dublin town hung they out a flag of war
  'Twas better to die 'neath that Irish sky than at Sulva or Sud-El-Bar
  And from the plains of Royal Meath strong men came hurrying through
  While Brittania's Huns with their long range guns sailed in through the foggy dew
  ."
  
\markup \column \string-lines
  "Their bravest fell and the requiem bell rang mournfully and clear
  For those who died that Eastertide in the springing of the year
  While the world did gaze with deep amaze at those fearless men but few
  Who bore the fight that freedom's light might shine through the foggy dew
  ."
  
\markup \column \string-lines
  "And back through the glen, I rode again and my heart with grief was sore
  For I parted then with valiant men whom I never shall see n'more
  But to and fro in my dreams I go and I kneel and pray for you
  For slavery fled, O glorious dead when you fell in the foggy dew"

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
    \tempo 4 = 80
  }
}
