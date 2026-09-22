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

verseOne = \lyricmode {
  As _ down _ the glen one _ Eas -- ter morn to a city _ _ _ fair rode I
  There _ armed _ _ lines of _ mar -- ching men in _ squa _ -- drons _ passed me by
  No pipe did hum, no _ bat -- tle drum did _ sound its _ dread _ ta _ -- too 
  But the An -- gel -- us Bells o'er the Liff -- ey swells rang _ out _ in the fog -- gy dew
}

verseTwo = \lyricmode {
  Right _ proud -- ly _ high _ in Dub -- lin town hung _ they _ out a flag of war
  'Twas _ be -- tter to die 'neath that Ir -- ish sky than at Su -- vla _ or Sud -- -El- -- Bar
  And from the plains of _ Roy -- al Meath strong _ men came _ hurr -- _ y -- ing through
  While Britt -- an -- ia's _ Huns with their long range guns sailed _ in _ through the fog -- gy dew
}
  
verseThree = \lyricmode {
  The -- ir bra -- _ vest fell and the re -- quiem bell rang _ mourn _ fu --  _ lly and clear
  For _ those who _ died that _ Eas -- ter -- tide in the spring _ _ ing of the year
  The world did gaze with _ deep a -- maze at those fear -- less _ men _ but _ few
  Who _ bore the _ fight that _ free -- dom's light might _ shine _ through the fog -- gy dew
}
  
verseFour = \lyricmode {
  And _ back through the glen, I _ rode a -- gain and my heart _ with _ grief was sore
  For I par -- ted _ then with _ val -- iant men whom I ne -- ver shall _ see n' -- more
  But to and fro in my dreams I go and I kneel and _ pray _ for _ you
  For _ slav -- ery _ fled, O _ glor -- ious dead when you fell _ in the fog -- gy dew
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
      \new Voice = "melody" {
        \thistune
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
      \new Lyrics \lyricsto "melody" {
        \verseFour
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
    \tempo 4 = 80
  }
}
