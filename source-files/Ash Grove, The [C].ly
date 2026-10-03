#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "The Ash Grove"
  composer = "Welsh trad. / English yrics by John Oxenford"
  arranger = "https://en.wikipedia.org/wiki/The_Ash_Grove"
  tagline = ""
}

keytimetempo = {
  \key c \major
  \time 3/4
  \tempo "brisk" 4=105
  \numericTimeSignature %use "4/4" instead of "C"

  %\clef "treble_8"
  %\set strokeFingerOrientations = #'(down up)
  %\override Fingering.staff-padding = #'()
  %\override TupletBracket.bracket-visibility = ##t
}

melody = \relative c'' {
  \partial 2 { g }
  c f a | f8(e) d c | gf e d c b g
  \fine
}

thesechords = \chordmode {
}

thelyrics = \lyricmode {
  The ash grove, how graceful, how plainly 'tis speaking;
The lark through its branches is gazing on me,
When over its branches the sunlight is breaking,
A host of kind faces is gazing on me.
The friends of my childhood again are before me;
Each step wakes a memory as freely I roam.
With (soft) whispers laden the leaves rustle o'er me;
The ash grove, the ash grove alone (again) is my home.
 
Down yonder green valley where streamlets meander,
When twilight is fading I pensively rove,
Or at the bright noontide in solitude wander
Amid the dark shades of the lonely ash grove.
'Twas there while the blackbird was cheerfully singing
I first met that dear one, the joy of my heart.
Around us for gladness the bluebells were ringing,
But then little thought I how soon we should part.
 
My lips smile no more, my heart loses its lightness;
No dream of the future my spirit can cheer.
I only can brood on the past and its brightness;
The dear ones I long for again gather here.
From ev'ry dark nook they press forward to meet me;
I lift up my eyes to the broad leafy dome,
And others are there, looking downward to greet me;
The ash grove, the ash grove again is my home.
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
