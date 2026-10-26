\version "2.26.0"

% Resolve fonts through LilyPond's search path, including with -o /another/directory.
#(ly:font-config-add-font
   (ly:find-file "lilyjazz/supplementary-files/lilyjazz-text/lilyjazz-text.otf"))
#(ly:font-config-add-font
   (ly:find-file "lilyjazz/supplementary-files/lilyjazz-chord/lilyjazz-chord.otf"))
\include "styles/lilyjazz.ily"
\include "lilyjazz/stylesheet/jazzchords.ily"

\layout {

  ragged-right = ##f

  \override Score.TextScript.font-name = #"lilyjazz-text"
  \override Score.Clef.break-visibility = ##(#f #f #f)
  \override Score.KeySignature.break-visibility = ##(#f #f #f)
  \override Score.SystemStartBar.collapse-height = #1

  \omit Score.BarNumber

}

\book {

  \paper {

    indent = 0\mm
    tagline = ##f
    ragged-bottom = ##t

    scoreTitleMarkup = \markup {
      \fill-line {
        \fontsize #1 \lower #1 \rotate #7 \fromproperty #'header:meter
        \fontsize #7
        \override #'(offset . 7)
        \override #'(thickness . 6)
        \underline \fromproperty #'header:title
        \fontsize #1 \lower #1 \fromproperty #'header:composer
      }
    }

  }

  \include "scores/all.ly"

}
