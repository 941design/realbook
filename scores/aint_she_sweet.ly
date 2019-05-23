\version "2.18.2"

\score {

  \header {
    title = "Ain't She Sweet"
    composer = "M. Ager"
    meter = "Swing/Dixie"
  }
  <<
    \new ChordNames \chordmode {
      \set chordChanges = ##t

      bes2:6 es:9/b | c:m7 f:7 | bes:6 es:9/b | c:m7 f:7 |
      bes2:6 d:7 | g:7 g:7.5+ |
      {
        { c:7 f:7 | bes:6 f:7.5+ }
        { c:7 f:7 | bes:6 bes:7 }
      }

      % TODO - chord over more than one bar
      es1:9 | es:9 | bes:maj7 | bes:7 |
      es1:9 | es:9 | bes2:6 bes:dim | c:m7 f:7 |

      bes2:6 es:9/b | c:m7 f:7 | bes:6 es:9/b | c:m7 f:7 |
      bes2:6 d:7 | g:7 g:7.5+ | c:7 f:7 | bes1:6 |
    }

    \new Staff \relative c'' {
      \numericTimeSignature
      \key bes \major

      % TODO - start with bar ||:
      \repeat volta 2 {
        g2 fis | f r8 g4 f8 | g4 g fis fis | f2 r8 g4 f8 |
        \break
        bes4 bes a a | g g8 g ~ g f es4 |
      }
      \alternative {
        {d2 c | bes r }
        { d2 c | bes4 bes' bes8 bes4 bes8 ~ }
      }
      \bar "||"
      \break

      % TODO - start with bar ||
      bes1 ~ | bes4 bes bes bes | bes2 f ~ | f4 bes bes8 bes4 bes8 ~ |
      \break
      bes1 ~ | bes4 bes bes bes | bes2 f ~ | f1 |
      \bar "||"
      \break

      g2 fis | f r8 g4 f8 | g4 g fis fis | f2 r8 g4 f8 |
      \break
      bes4 bes a a | g g8 g ~ g f es4 | d2 c | bes r |
      \bar "||"
    }
  >>
}
