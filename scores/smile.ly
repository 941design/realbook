\version "2.24.0"

\score {

  \header {
    title = "Smile"
    composer = "Charles Chaplin"
    meter = #"Ballad"
  }
  <<
    \new ChordNames \chordmode {
      \set chordChanges = ##t

      f1:maj7 | f:maj7 | f:maj7 | f:maj7 |
      f1:maj7 | as:dim7 | g:m7 | d:7.9- |

      g1:m | g:m | bes:m7 | es:7 |
      f1:maj7 | f:maj7 | g:m7 | c2:7.9- ges:7 |

      f1:maj7 | f:maj7 | f:maj7 | f:maj7 |
      f1:maj7 | as:dim7 | g:m7 | d:7.9- |

      g1:m7 | c:7.9- | as:m7 | des:7.9- |
      g1:m7 | c2..:7.9- f8:maj7 | f1:maj7 | f:maj7 |

    }

    \new Staff \relative c' {
      \numericTimeSignature
      \key f \major

      f2 g4 a | g f e d | e2 f4 g | f e d c |
      \break
      d2 e4 f | d2 e4 f | g2 a4 bes | fis2 g4 a |
      \bar "||"
      \break

      bes2 c4 d | c bes a g | bes2 c4 des | c bes a g |
      \break
      as2 bes4 a | bes a g f | g2. d4 | as'2 as |
      \bar "||"
      \break

      f2 g4 a | g f e d | e2 f4 g | f e d c |
      \break
      d2 e4 f | d2 e4 f | g2 a4 bes | fis2 g4 a |
      \bar "||"
      \break

      bes2 c4 d | c bes a g | r ces des es | des ces bes as |
      \break
      r4 a bes c | bes a g a8 f | r1 | r |
      \bar "||"
      \break
    }
  >>
}
