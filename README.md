# Realbook

A Realbook style collection of sheetmusic, created with [lilypond](http://lilypond.org).

## Design Goals

+ should not require any scripting or templating in addition to lilypond/[guile](https://www.gnu.org/software/guile/)
+ should look as neat as the classics
+ should be transposable (__TODO__)

## Similar Projects

+ Mark Veltzer's [openbook](https://github.com/veltzer/openbook) is a very popular and versatile resource. I chose not to built upon it, because I did not like the idea of templating. As stated in my design goals, I want to achieve a lilypond only solution. However, for now I will not duplicate songs that are also contained in the openbook maually(!) myself. I have not yet looked into the generated lilypond files with respect to importing them verbosely, but that could be an option.

## Prerequisites

+ [LilyPond](https://lilypond.org) **2.26.x**, tested with **2.26.0**
+ [make](https://www.gnu.org/software/make/) (optional)
+ the checked-out `lilyjazz` submodule, including its bundled fonts

LilyPond is a separate compiler; cloning this repository does not install it. The project now uses the 2.26 font configuration API and no longer supports 2.24. `make` checks the installed compiler before building. The `\version` declaration in the score describes its syntax version; it does not install or pin the executable. CI pins the compiler to 2.26.0.

On macOS with Homebrew:

```sh
brew install lilypond
lilypond --version
```

Alternatively, download and extract the appropriate **2.26.0** bundle from the [official downloads](https://lilypond.org/download.html). It can live outside the system installation; point `make` at its executable:

```sh
make realbook LILYPOND=/path/to/lilypond-2.26.0/bin/lilypond
```

Ubuntu 24.04's `apt install lilypond` supplies 2.24, which is too old for this project. Use the official Linux x86-64 bundle instead; Linux ARM64 requires a suitable package or a source build. No system-wide font installation is needed.

## Usage

From the repository root, initialize the font dependency:

```sh
git submodule update --init --recursive
```

Build the book:

```sh
make realbook
# Without make:
lilypond -I lilyjazz/otf -o realbook main.ly
```

This creates `realbook.pdf` containing the six scores included in [./scores/all.ly](./scores/all.ly). Open the resulting PDF to view the book; there is no application server to start. `make` rebuilds the PDF when scores, stylesheets, or fonts change. Use `make clean` to remove the generated PDF.

The book uses the [OpenLilyPondFonts LilyJAZZ distribution](https://github.com/OpenLilyPondFonts/lilyjazz), pinned by the submodule to commit `8fa7d5548ec553eea9b2189a652e089e1eec4209`. It provides native music fonts and separate text and chord fonts, including the accidental glyphs used by its chord stylesheet. The dependency uses HTTPS, so cloning it does not require an SSH key.

The book loads these files directly, so `lyp` and a system font installation are not required. The `-I lilyjazz/otf` argument makes the music fonts available to LilyPond. Run the build from the repository root so the font directories resolve correctly. Font licenses and attribution are included in the dependency.

[styles/lilyjazz.ily](./styles/lilyjazz.ily) is a project-local conversion of the upstream music stylesheet to LilyPond 2.26 syntax. The upstream copy still calls the removed `set-global-fonts` function and must not be included directly.

To add music, create a score in the [./scores](./scores/) directory, and include it in [./scores/all.ly](./scores/all.ly).

## Verification

`make check` additionally requires Python 3 and Poppler's `pdfinfo`, `pdftotext`, and `pdffonts` tools. On macOS, install Poppler with `brew install poppler`. On Ubuntu 24.04, install the verification tools with the following command, after installing LilyPond 2.26 separately:

```sh
sudo apt-get install make python3 poppler-utils
make check
```

The check builds in a temporary directory with warnings treated as errors, verifies one titled page per included score, and checks that the music, text, and chord fonts are embedded. A visual review is still needed for musical correctness and layout. GitHub Actions downloads the official 2.26.0 compiler bundle, verifies its SHA-256 checksum, runs the same check, and builds the PDF without publishing it.

## TODO

Pull requests welcome.

+ add LICENCE file
+ create score overlay underneath header as in _the_ Realbook
+ create toc and title page
+ substitute ./scores/all.ly by lisp function, collecting all scores in alphabetical order from ./scores directory
+ allow easy transposition of all scores
+ include source of each transcription in header/tagline if there are no legal issues with that
+ if there are no legal issues, publish realbook.pdf as artifact
+ read scores location from environment variable and only default to ./scores
+ default globally to `\set chordChanges = ##t`, i.e. omit redundant chords repetitions over more than one bar
+ default globally to `\numericTimeSignature`, i.e. 4/4 measure as '4/4' instead of 'c)'
+ dynamically expand alternatives on demand
+ git commit hooks
  + lint
  + remove trailing whitespace
  + replace tabs
  + reindent
  + use formatter (lilypond?, frescobaldi?)
+ build
  + midi
  + epub
  + mp3?
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
