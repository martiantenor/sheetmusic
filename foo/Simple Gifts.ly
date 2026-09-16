\version "2.18.2"

\language "english"		%For note names like "eb" and "ds"
\include "articulate.ly"	%For more musical MIDI output

\paper {
  indent = 0
  %print-all-headers = ##t
}

\header {
  title = "Simple Gifts"
  composer = "Shaker trad. / Joseph Brackett (1848)"
  arranger = "arr. Simon Salz"
  tagline = "From Alfred Music, 21st Centry PRO METHOD Classical & Fingerstyle Guitar"
}

keytimetempo = {
  \key c \major
  \time 4/4
  \tempo 4=100
  \clef "treble_8"
  %\set strokeFingerOrientations = #'(down up)
  %\override Fingering.staff-padding = #'()
  \override TupletBracket.bracket-visibility = ##t
}

barreii = {
  \override TextSpanner.bound-details.left.text = "II "
  \override TextSpanner.dash-period = #1.0
}

RH = #rightHandFinger

tunesimplegifts = \relative c' {
  % Represent with two voices
  <<
   
    % Upper part
    \new Voice { \voiceOne
      \partial 4 { g8\RH#3 g\RH#2 }
      c4\RH#3 c8\RH#3 d\RH#2 e4\RH#4 e8\RH#4 f\RH#2 | g4 g8 f e4 d8 c |
      d4 d d c | d8 e d b g4. g8 |
    }
    
    % Middle part
    \new Voice { \voiceFour
      \partial 4 { s4 }
      r8 g4.\RH#2 r8 g4. | r8 g4. r8 g4. | r8 g4 g8~g8 g4 g8 | s1 |
    }
    
    % Bass part
    \new Voice { \voiceTwo
      \partial 4 { s4 }
      c,2\RH#1 d2 | e2 a,2 | b2 a2 | g2 g8 a b |
    }
  >>
}

tuneflattened = \absolute {
}

\score {
  \new StaffGroup <<
    \new Staff {
      \accidentalStyle "modern"
      \keytimetempo
      \tunesimplegifts
    }
    \new TabStaff {
      \tabChordRepeats
      \keytimetempo
      \tuneflattened
    }
  >>
%   \new Staff {
%     \accidentalStyle "modern"
%     \keytimetempo
%     \tunesimplegifts
%   }
  \layout { }
}

\score {
  \new Staff {
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
    \accidentalStyle "modern"
    \keytimetempo
    \unfoldRepeats \articulate {
      \tunesimplegifts
    }
  }
  \midi {
    \tempo 4 = 70
  }
}