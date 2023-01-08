\version "2.18.2"

\score {
  \header {
    title = "Tasty Testing"
    composer = "Some Composer"
    source = #"345 Jazz Standards"
    meter = #"(Med. Swing)"
  }
  \new Staff \relative c' {
    c e g
  }
}