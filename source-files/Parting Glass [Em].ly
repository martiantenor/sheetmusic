#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style-sheet)
\version "2.24.0"
\include #style-sheet

headerpartingglass = \header {
  title = "The Parting Glass"
  subtitle = ""
  composer = "Scottish trad."
  tagline = "Transcribed from Case Men's Glee Glub by Dave Blair, 2018. Lyrics from Wikipedia."
}

keytimetempo = {
  \time 2/4
  \key e \minor
  \tempo "lento" 4=40
}

%{
chordNames = \chordmode {
  \global
}
%}

melody = \relative c'' {
  \keytimetempo
  \partial 8 {
  b16 ( a )
  }
  g8 e e d16( e ) | g8 g a g16( a) | b8 b b16( a) g( a) | b8 d, d4~ | d4. b'16( a) |
  g8 e e d16( e ) | g8 g a g16( a) | b8 e d16( b) a( b) | g8 e e4~ | e4. d'8 |
  d8 e d8. d16 | d8 e d8. \grace b32 b16 | c8 b b16( a) g( a) | b8 d, d4~ | d4. b'16( a) |
  g8 e e d16( e) | g8 g a g16( a) | b8 e d16( b) a( b) | g8 e e4~ | e2 |
}


verseOne = \lyricmode {
  Of all the mon -- ey __ e'er I had
  I __ spent it in __ good __ com -- pa -- ny __
  And all the harm I've __  ev -- er done
  A -- las it was __ to __ none but me. __
  And all I've done for want of wit
  To mem -- 'ry now __ I __ can't re -- call __
  So __ fill to me the __ part -- ing glass
  Good __ night and joy __ be __ with you all __
}

verseTwo = \lyricmode {
  Of all the com -- rades_that e'er I had
  They're sor -- ry for __ my __ going a -- way __
  And __ all the sweet -- hearts_that e'er I had
  They'd __ wish me one __ more __ day to stay __
  But since it feel un -- to my lot
  That I should rise __ and __ you  should not __
  I __ gent -- ly rise and soft -- ly call
  Good __ night and joy __ be __ with you all __
}

verseThree = \lyricmode {
  A __ man may drink and __ not be drunk
  A __ man may fight __ and __ not be slain __
  A __ man may court a __ pret -- ty girl
  And_per -- haps be wel -- comed back a -- gain __
  But since it has so ought to be
  By_a time to rise __ and_a time to fall __
  Come __ fill to me the __ part -- ing glass
  Good __ night and joy __ be __ with you all __
}
  


\score {
  \header {
    \headerpartingglass
  }
  <<
    \new Staff
    <<
      \keytimetempo
      \accidentalStyle "modern"
      \new Voice = "melody" {
        \voiceOne
        \melody
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
    >>
  >>
  \layout { }
}
