%%%% The stylesheet for LILYJAZZ music font and LILYJAZZ-TEXT font
%%%% Adapted from lilyjazz/stylesheet/lilyjazz.ily with LilyPond 2.26 convert-ly.
%%%% Kept locally because the pinned upstream stylesheet uses set-global-fonts.
%%%%
%%%% In order for this to work, this file's directory needs to
%%%% be placed in LilyPond's path
%%%%
%%%% NOTE: If a change in the staff-size is needed, include
%%%% this file after it, like:
%%%%
%%%% #(set-global-staff-size 17)
%%%% \include "lilyjazz.ily"
%%%%
%%%% Copyright (C) 2014-2016 Abraham Lee (tisimst.lilypond@gmail.com)

\version "2.26.0"

\paper {
  property-defaults.fonts.music = "lilyjazz"
  property-defaults.fonts.serif = "lilyjazz-text"
  property-defaults.fonts.sans = "lilyjazz-chord"
}

\layout {
  \override Score.Hairpin.thickness = #2
  \override Score.Stem.thickness = #2
  \override Score.TupletBracket.thickness = #2
  \override Score.VoltaBracket.thickness = #2
  \override Score.SystemStartBar.thickness = #4
  \override StaffGroup.SystemStartBracket.padding = #0.25
  \override ChoirStaff.SystemStartBracket.padding = #0.25
  %\override Staff.Tie.thickness = #3
  \override Staff.Tie.line-thickness = #2
  \override Staff.Slur.thickness = #3
  \override Staff.PhrasingSlur.thickness = #3
  \override Staff.BarLine.hair-thickness = #4
  \override Staff.BarLine.thick-thickness = #8
  \override Staff.MultiMeasureRest.hair-thickness = #3
  \override Staff.MultiMeasureRestNumber.font-size = #2
  \override LyricHyphen.thickness = #3
  \override LyricExtender.thickness = #3
  \override PianoPedalBracket.thickness = #2
}
