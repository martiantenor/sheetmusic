#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Bella Ciao"
  composer = "Italian antifascist, c. 1953"
  arranger = "https://en.wikipedia.org/wiki/Bella_ciao"
}

keytimetempo = {
  \key d \minor
  \time 4/4
  \tempo "march" 4=100
  \numericTimeSignature %use "4/4" instead of "C"
}

thistune = \relative c' {
  \keytimetempo
  
  \partial 4.
  \repeat volta 6 {
    a8 d e |
    f d4.(d8) a d e | f d4.(d8) a d e | f4 e8 d f4 e8 d | a'4 a a8 a g a |
    bf8 bf4.(bf8) bf a g | bf8 a4.(a8) a g f | e4 a f e d2 r8 
  }
}

verseOne = \lyricmode {
  U -- na ma -- tti -- na mi son sve -- glia -- to,
  O bell -- a ciao, bell -- a ciao, bell -- a ciao, ciao, ciao!
  U -- na ma -- tti -- na mi son sve -- glia -- to
  E ho tro -- va -- to l'in -- va -- sor.
}

verseTwo = \lyricmode {
  O par -- ti -- gia -- no por -- ta -- mi vi -- a,
  O bell -- a ciao, bell -- a ciao, bell -- a ciao, ciao, ciao!
  O par -- ti -- gia -- no por -- ta -- mi vi -- a,
  Che _ mi sen -- to di mo -- rir.
}

verseThree = \lyricmode {
  E se io muo -- io da par -- ti -- gia -- no,
  O bell -- a ciao, bell -- a ciao, bell -- a ciao, ciao, ciao!
  E se io muo -- io da par -- ti -- gia -- no,
  Tu mi de -- vi se _ -- ppell -- ir.
}

verseFour = \lyricmode {
  E se -- ppell -- ir -- e lass -- ù~in mon -- ta -- gna,
  O bell -- a ciao, bell -- a ciao, bell -- a ciao, ciao, ciao!
  E se -- ppell -- ir -- e lass -- ù~in mon -- ta -- gna,
  So -- tto l'om -- bra di un bel fior.
}

verseFive = \lyricmode {
  E le gen -- ti che pass -- e -- ra _ -- nno
  O bell -- a ciao, bell -- a ciao, bell -- a ciao, ciao, ciao!
  E le gen -- ti che pass -- e -- ra _ -- nno
  Ti di -- ra -- nno o che bel fior.
}

verseSix = \lyricmode {
  È ques -- to~il fio -- re del par -- ti -- gia -- no
  O bell -- a ciao, bell -- a ciao, bell -- a ciao, ciao, ciao!
  È ques -- to~il fio -- re del par -- ti -- gia -- no
  Mo _ -- rto per la li -- ber -- tà.
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
        \thistune
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
      \new Lyrics \lyricsto "melody" {
        \verseFive
      }
      \new Lyrics \lyricsto "melody" {
        \verseSix
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
