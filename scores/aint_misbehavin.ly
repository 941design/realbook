\version "2.18.2"

\score {

  \header {
    title = "Ain't Misbehavin'"
    composer = "F. Waller"
    meter = "(Med. Swing)"
  }
  <<
    \new ChordNames \chordmode {
      es2:maj7 c2:m7 | f2:m7 bes:9 | es g:7.5+ | as:6 as:m6 |
      es ges:7 | f:m7 bes:9 |
      {
        { es e:dim7 | f:7 bes:7 }
        { es:6 as | es:6 g:7 }
      }

      c1:m | as:7/c | f:7/c | c:7 |
      bes2 b:dim | c:m f:9 | bes:7 c:7 | f:7 bes:7 |

      es2:maj7 c:m7 | f:m7 bes:9 | es g:7.5+ | as:6 as:m6 |
      es ges:7 | f:m7 bes:7 | es:6 c:7 | f:m7 bes:7 |
    }
    
    \new Staff \relative c' {
    \key es \major

    % TODO - start with bar ||:
    \repeat volta 2 {
      r8 es f es bes' bes4. | r8 f g f c'2 | r8 bes c bes es es4 d8 | f es c g ~ g ges f4 |
      \break
      r8 es f es bes' bes4.  | r8 f g f c' c4 bes8 |
    }
    \alternative {
      { g1 ~ | g2 r }
      { es1 ~ | es2 r }
    }
    \bar "||"
    \break

    % TODO - start with bar ||
    r4 es'8 c es c4. | r4 es8 c es c4. | r4 es8 c es c4. | r4 e8 c e c4. |
    \break
    r4 f f f | f es d c | bes2 c | g f
    \bar "||"
    \break

    r8 es f es bes' bes4. | r8 f g f c'2 | r8 bes c bes es es4 d8 | f es c g ~ g ges f4 |
    \break
    r8 es f es bes' bes4. | r8 f g f c' c4 bes8 | es1 | r |
    \bar "||"
  }
  >>
}
