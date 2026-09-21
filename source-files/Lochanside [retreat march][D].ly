#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Lochanside Retreat March"
  arranger = "Ceolachan, https://thesession.org/tunes/6479#setting18181"
  composer = "John McLellan (Scottish)"
}

keytimetempo = {
  \key d \major
  \time 3/4
  \tempo "retreat march" 4=75-130
}

thistune = \relative c'' {
  \keytimetempo
  
  \partial 4 a4
  
  % A section
  \repeat volta 2 {
    d8. e16 fs4 fs8 a | g e fs4 d4 |
    a'8. fs16 d4 d8. e16 | fs8. d16 fs4 e4 |
    e8. d16 cs4 cs8 a' | g e d4 a | e'8. fs16 g4 g8 b, | cs a d4 d |
  }
  \break
  
  % B section
  \repeat volta 2 {
    d8. fs16 a4 a8. g16 | fs8. g16 a4 fs4 |
    d8 a b4 g'8. fs16 | e8 d fs4 e |
    e8. d16 cs4 cs8 a' | g e d4 a |
    e'8. fs16 g4 g8 b, | cs8 a d4 d |
  }
  % \alternative {
%     { cs8 a d4 a }
%     { cs8 a d4 d }
%   }
  
  % C section
  \repeat volta 2 {
    cs8. b16 a4 a8 cs | e g fs4 d | cs8. b16 a4 a8 cs |
    e16 a8. fs4 e8 a, | d8. fs16 a4 fs8 a | g16. fs32 e16. d32 cs4 b |
    e8. fs16 g4 g8 b, | cs a d4 d |
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
      \set Staff.midiInstrument = #"oboe"
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
