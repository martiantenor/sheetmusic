#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

thisheader = \header {
  title = "Over the Rainbow"
  subtitle = "from the 1939 film \"The Wizard of Oz\""
  composer = "music by Harold Arlen"
  poet = "lyrics by Yip Harburg"
  arranger = "chords from Ultimate Guitar, Ver. 2"
  meter = ""
  tagline = ""
}

keytimetempo = {
  \key c \major
    %originally sung in A-flat Major
  \time 4/4
  \tempo "moderately" 4 = 80
}

thistune = \relative c' {
  \keytimetempo

  \repeat volta 3 {
    c2 c' | b4 g8 a b4 c | c,2 a' | g1 |
    a,2 f' | e4 c8 d e4 f | d4 b8 c d4 e |
    \alternative {
      \volta 1 {
        c2. r4 |
      }
      \volta 2 {
        c2. r8 g'8 |
        e8 g e g e g e g | f g f g f g f g | a2 a4. g8 |
        e8 g e g e g e g | fs a fs a fs a fs a | b2 b | d g, |
      }
      \volta 3 {
        c2. r8 g'8 |
      }
    }
  }
  e,8 g e g e g e g | f g f g f g a b | c1\fermata |

  % unfolded, no written repeats
  %\repeat unfold 2 {
  %  c2 c' | b4 g8 a b4 c | c,2 a' | g1 |
  %  a,2 f' | e4 c8 d e4 f | d4 b8 c d4 e |
  %  \alternative {
  %    \volta 1 {
  %      c2. r4 |
  %    }
  %    \volta 2 {
  %      c2. r8 g'8 |
  %    }
  %  }
  %}
  %e8 g e g e g e g | f g f g f g f g | a2 a4. g8 |
  %e8 g e g e g e g | fs a fs a fs a fs a | b2 b | d g, |
  %
  %c,2 c' | b4 g8 a b4 c | c,2 a' | g1 |
  %a,2 f' | e4 c8 d e4 f | d4 b8 c d4 e |
  %c2. r8 g'8 |
  %e8 g e g e g e g | f g f g f g a b | c1\fermata |
  %
  %\fine

}

thesechords = \chordmode {
  \repeat volta 3 {
    %first time only?
    %c2 fs:m7.5- | e2.:m c4:9 | f1:6 | e2:m7 a:7.5+.9- |
    %f2:6 f:m | c2 a:7.5+.9- | d2:9 f |

    c2 a:m | a1:m | f1 | c |
    f2 f:m | c2. a4:m | d2.:m7 g4:7 |
    \alternative {
      \volta 1 {
        %first time only?
        %c2 g:9 |
        c1 |
      }
      \volta 2 {
        c1 |
        c1 | d:m7 | a2:m d4:m7 g:7 |
        c1 | b:7 | e:m | d2:m7 g:7 |
      }
      \volta 3 {
        c1 |
      }
    }
  }
  c1 | d2.:m7 g4 | c1\fermata |
}

lyricsA = \lyricmode {
  Some -- where o -- ver the rain -- bow way up high
  there's a land that I heard of once in a lull -- a -- by.
}
lyricsB = \lyricmode {
  Some -- where o -- ver the rain -- bow skies are blue,
  And the dreams that you dare to dream real -ly do come true.
  _ Some -- day I'll wish up -- on a star
  and wake up where the clouds are far be -- hind me.
  Where troub -- les melt like lem -- on drops
  a -- way a -- bove the chim -- ney tops that's where you'll find me...
}
lyricsC = \lyricmode {
  Some -- where o -- ver the rain -- bow blue -- birds fly.
  Birds fly o -- ver the rain -- bow why then oh why can't I? _
}
lyricsCoda = \lyricmode {
  _ If hap -- py lit -- tle blue -- birds fly be -- yond the rain -- bow
  why oh why can't I?
}

% works with unfolded version
%theselyrics = \lyricmode {
%  Some -- where o -- ver the rain -- bow way up high
%  There's a land that I heard of once in a lull -- a -- by
%  Some -- where o -- ver the rain -- bow skies are blue,
%  And the dreams that you dare to dream real -ly do come true.
%  Some -- day I'll wish up -- on a star
%  and wake up where the clouds are far be -- hind me
%  Where troub -- les melt like lem -- on drops
%  a -- way a -- bove the chim -- ney tops that's where you'll find me
%  Some -- where o -- ver the rain -- bow blue -- birds fly
%  Birds fly o -- ver the rain -- bow why then oh why can't I
%  If hap -- py lit -- tle blue -- birds fly be -- yond the rain -- bow
%  why oh why can't I? _
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
        <<
        \new Lyrics {
          \set associatedVoice = "melody"
          \lyricsA
        }
        \new Lyrics {
          \set associatedVoice = "melody"
          \lyricsB
        }
        \new Lyrics {
          \set associatedVoice = "melody"
          \lyricsC
        }
        >>
        \lyricsCoda
        }


      %{ %unfolded version
      \new Lyrics \lyricsto "melody" {
        \theselyrics
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
      %}
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
    \tempo 4. = 120
  }
}
