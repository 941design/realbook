# Realbook

A Realbook style collection of sheetmusic, created with [lilypond](http://lilypond.org).

## Design Goals

+ should not require any scripting or templating in addition to lilypond/[guile](https://www.gnu.org/software/guile/)
+ should look as neat as the classics
+ should be transposable (__TODO__)

## Similar Projects

+ Mark Veltzer's [openbook](https://github.com/veltzer/openbook) is a very popular and versatile resource. I chose not to built upon it, because I did not like the idea of templating. As stated in my design goals, I want to achieve a lilypond only solution. However, for now I will not duplicate songs that are also contained in the openbook maually(!) myself. I have not yet looked into the generated lilypond files with respect to importing them verbosely, but that could be an option.

## Prerequisites

+ [lilypond](http://lilypond.org) 2.18 or newer(?)
+ [make](https://www.gnu.org/software/make/) (optional)

## Usage

Run `lilypond -o realbook main.ly` to create `realbook.pdf` containing all scores in the [./scores](./scores/) directory. Alternatively, run `make realbook`.

To add music, create a score in the [./scores](./scores/) directory, and include it in [./scores/all.ly](./scores/all.ly).

## TODO

Pull requests welcome.

+ add LICENCE file
+ add single bar at beginning of each line
+ create score overlay underneath header as in _the_ Realbook
+ create toc and title page
+ substitute ./scores/all.ly by lisp function, collecting all scores in alphabetical order from ./scores directory
+ allow easy transposition of all scores
+ include source of each transcription in header/tagline if there are no legal issues with that
+ test with newer lilypond version
+ if there are no legal issues, publish realbook.pdf as artifact
+ read scores location from environment variable and only default to ./scores
+ display chords over more than one bar
+ denote 4/4 measure as '4/4' instead of 'c)'
+ create yeoman template for new scores, asking for:
  + title
  + composer
  + meter
  + measure
  + key
  + shape (e.g. AABA)

## Credits

Many thanks to the kind and helpful [lilypond](http://lilypond.org) community.

This project was largely based on and inspired by [Leigh Verlag's blogpost](http://leighverlag.blogspot.com/2015/12/mimicking-real-book-look.html)
