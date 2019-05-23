\score {

  \header {
    title = "Please Don't Talk About Me When I'm Gone"
    composer = "S. Stept"
    meter = "Swing"
  }
  <<
    \new ChordNames \chordmode {
      \set chordChanges = ##t

      es1:6 | g:7 | c:7 | des2:13 c:7 |
      f1:9 | bes:13 | es2:6 c:7.9- | f:m7 bes:9 |

      es1:6 | g:7 | c:7 | des2:13 c:7 |
      f1:9 | bes:13 | es:6 | es:6 |

      g1:7 | as2:7 g:7 | c1:7 | c2:7 ges:7.11+ |
      f1:9 | f1:9 | bes2:7 ges:dim | f:m7 bes:7 |

      es1:6 | g:7 | c:7 | des2:13 c:7 |
      f1:9 | f2:m7/bes bes:7 | es1:6 | es1:6 |
    }

    \new Staff \relative c'' {
      \numericTimeSignature
      \key es \major

      es4 g, bes8 es4 d8 ~ | d4 g, b8 d4 c8 ~ |c1 ~ | c4 bes as g |
      \break
      g4 es f8 fis4 g8 ~ | g4 c bes8 c g4 ~ | g1 ~ | g8 r bes4 c d |
      \bar "||"
      \break

      es4 g, bes8 es4 d8 ~ | d4 g, b8 d4 c8 ~ |c1 ~ | c4 bes as g |
      \break
      g4 es f8 g4 c8 ~ | c4 c bes g | es1 ~ | es8 r f4 g bes |
      \bar "||"
      \break

      es8 d4 f8 ~ f4 g, | es'8 d4 f8 ~ f4 es | d c d c ~ | c1 |
      \break
      d8 c4 es8 ~ es4  f,4 | d'8 c4 f8 ~ f4 d | c bes a c | bes2. r4 |
      \bar "||"
      \break

      es4 g, bes8 es4 d8 ~ | d4 g, b8 d4 c8 ~ |c1 ~ | c4 bes as g |
      \break
      es'4 c c4. es8 | f4 f es d | es1 | r |
      \bar "||"

    }
  >>
}
