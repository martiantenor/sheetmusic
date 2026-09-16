\version "2.18.2"

\language "english"		%For note names like "eb" and "ds"
\include "articulate.ly"	%For more musical MIDI output

\paper {
  indent = 0
  print-all-headers = ##t
}

tunepearlwedding = \relative c' {
  \key d \major
  \time 4/4
  \tempo "reel" 4=75-130
    
  % A section
  \repeat volta 2 {
    \partial 4 r4
    d4.\mordent e8 d fs a d | e fs \grace g( fs) e d b b16 cs16 d8 |
    fs,8 a a b a fs a d | cs e e fs e a, g16 fs16 e8 |
    d4.\mordent e8 d fs a d | e fs \grace g( fs) e d b b16 cs16 d8 |
    a4.\mordent b8 a d \tuplet 3/2 {d e d} | cs8 d e cs d4 |
  }
  \break
  
  %B section
  \repeat volta 2 {
    \partial 4 e8 fs8
    g8 a \grace b( a) g \tuplet 3/2 {fs g fs} e8 d |
    b d \grace e( d) b a fs \tuplet 3/2 {fs e fs} |
    d8 fs a d fs a fs d | cs e e fs e4 fs8 g |
    a4.\mordent g8 \tuplet 3/2 {fs g fs} e d |
    b8 d \tuplet 3/2 {d cs d} a8 fs e fs |
    d fs a d, fs a a d | cs d e cs d4 |
  }
  
}

chordslochanside = \chordmode {
}

\score {
  \header {
    title = "The Pearl Wedding"
    arranger = "Dr. Dow, https://thesession.org/tunes/1190"
    composer = "Willy Taylor (Scottish, Northumbrian)"
  }
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordspearlwedding
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
        \tunepearlwedding
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
          \tunepearlwedding
        }
      }
    >>
  >>
  \midi {
    \tempo 4 = 120
  }
}