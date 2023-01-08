\version "2.18.2"

\score {

  \header {
    title = "Don't Get Around Much Anymore"
    composer = "Duke Ellington"
    meter = "Medium Swing"
  }
  <<
    \new ChordNames \chordmode {
      \set chordChanges = ##t

      s1 | c2:maj7  d4:m7 es8:m7 e:m7 | s1 | c2:maj7 bes:7 |
      a1:7 | d:m7 | g:7 | c:maj7 | g:7 |

      c2:maj7  d4:m7 es8:m7 e:m7 | s1 | c2:maj7 bes:7 |
      a1:7 | d:m7 | g:7 | c:maj7 | c:7 |

      f1:maj7 | bes:7 | c:maj7 | c:7 |
      f1:maj7 | fis2:m7.5- b:7 | e:m7 es:dim7 | d:m7 g:7 |

      c2:maj7  d4:m7 es8:m7 e:m7 | s1 | c2:maj7 bes:7 | a1:7 |
      d1:m7 | g:7 | c:maj7 | c:maj7 |

    }

    \new Staff \relative c' {
      \numericTimeSignature
      \key c \major
      \time 4/4
      % http://lilypond.org/doc/v2.18/Documentation/notation/beams
      \set Timing.beamExceptions = #'()

      r8 e'4 d8 c g f e ~ | \bar ".|" e1 | r8 e'4 d8 c g f e ~ | e1 |
      \break
      r8 g4 f8 e d c4 | c'4. a8~ a2 | r8 e f fis g c, dis e | c1 | r8 e'4 d8 c g f e ~ |
      \bar "||"
      \break

      e1 | r8 e'4 d8 c g f e ~ | e1 | r8 g4 f8 e d c4 |
      \break
      c'4. a8~ a2 | r8 e f fis g c, dis e | c1 | r2 r4 c'4 |
      \bar "||"
      \break

      d2 c8 a4 c8 ~ | c2. c4 | d2 c8 g4 e8~ | e2 r4 c' |
      \break
      d2 c8 a4 c8~ | c4. c8 ~ c2 | r8 b b b b4 a8 g | r8 e'4 d8 c g f e ~ |
      \bar "||"
      \break

      e1 | r8 e'4 d8 c g f e ~ | e1 | r8 g4 f8 e d c4 |
      \break
      c'4. a8~ a2 | r8 e f fis g c, dis e | c1 | r |
      \bar "|."

    }
  >>

}