#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Simple Gifts"
  composer = "Shaker trad. / Joseph Brackett (1848)"
  arranger = "arr. Simon Salz"
  tagline = ""
}

keytimetempo = {
  \key c \major
  \time 4/4
  \tempo 4=100
  \numericTimeSignature %use "4/4" instead of "C"

  \clef "treble_8"
  %\set strokeFingerOrientations = #'(down up)
  %\override Fingering.staff-padding = #'()
  %\override TupletBracket.bracket-visibility = ##t
}

thismelody = \relative c' {
  \partial 4 { g8 g }
  c4 c8 d e4 e8 f | g4 g8 f e4 d8 c |
  d4 d d c | d8 e d b g4. g8 |
}

% Middle part
thisharmony = \transpose c g { \relative c' {
    \partial 4 { s4 }
    r8 g4. r8 g4. | r8 g4. r8 g4. | r8 g4 g8~g8 g4 g8 | s1 |
    %r8 g4.\RH#2 r8 g4. | r8 g4. r8 g4. | r8 g4 g8~g8 g4 g8 | s1 |
  }
}
  
% Bass part
thisbass = transpose c g { \relative c' {
    \partial 4 { r4 }
    c,2 d2 | e2 a,2 | b2 a2 | g2 g8 a b |
    %c,2\RH#1 d2 | e2 a,2 | b2 a2 | g2 g8 a b |
  }
}

%tuneflattened = \absolute {
%}

\score {
  \header {
    \thisheader
  }
  \new GrandStaff <<
    \new Staff {
      \accidentalStyle "modern"
      \keytimetempo
      \thismelody
    }
    \new Staff {
      \accidentalStyle "modern"
      \keytimetempo
      \thisbass
    }
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
        \thismelody
      }
    }
  >>
  \midi {
    \tempo 4 = 70
  }
}
