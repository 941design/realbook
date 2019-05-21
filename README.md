# Realbook

A Realbook style collection of sheetmusic, created with [lilypond](http://lilypond.org).

## Design Goals

+ should not require any scripting or templating in addition to lilypond/[guile](https://www.gnu.org/software/guile/)
+ should look as neat as the classics
+ should be transposable (_TODO_)

## Prerequisites

+ [lilypond](http://lilypond.org) 2.18 or newer(?)
+ [make](https://www.gnu.org/software/make/)

## Usage

Run `make realbook` to create `realbook.pdf` containing all scores in the [./scores](./scores/) directory.

To add music, create a score in the [./scores](./scores/) directory, and include it in [./scores/all.ly](./scores/all.ly).

## TODO

Pull requests welcome.

+ add LICENCE 
+ add single bar at beginning of each line
+ create score overlay underneath header as in /the/ Realbook
+ create toc and title page
+ substitute ./scores/all.ly by lisp function, collecting all scores in alphabetical order from ./scores directory
+ allow easy transposition of all scores
+ include source of each transcription in header/tagline if there are no legal issues with that
+ test with newer lilypond version
+ if there are no legal issues, publish realbook.pdf as artifact
+ read scores location from environment variable and only default to ./scores.

## Credits

Many thanks to the kind and helpful [lilypond](http://lilypond.org) community.

This project was largely based on and inspired by [Leigh Verlag's blogpost](http://leighverlag.blogspot.com/2015/12/mimicking-real-book-look.html)
